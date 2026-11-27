'use strict';
// CodeQL js/xss (alerts 5, 6) and js/incomplete-url-scheme-check (7) are in
// the unmodified htmx 2.0.11 copy, assets/htmx.js: htmx parses the server's
// HTML into the page, and reads "javascript:" / "js:" values with eval. The
// templates escape what they output, and the page turns htmx's eval and
// response scripts off, which none of the templates use.
// Run: node --test htmx-config.test.cjs  (JSDOM=/path/to/jsdom for the browser part)
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const test = require('node:test');
const { execFileSync } = require('node:child_process');

const here = __dirname;
const read = rel => fs.readFileSync(path.join(here, rel), 'utf8');
const META = `meta{name="htmx-config", content='{"allowEval":false,"allowScriptTags":false}'}`;

test('both copies of the page turn off htmx eval and response scripts, and redbean.com serves it', () => {
  assert.ok(read('index.fmg').includes(META));
  assert.equal(read('tmpl/index.fmg'), read('index.fmg'), 'build-htmxboard.sh copies index.fmg to tmpl/');
  let zipped = null;
  try { zipped = execFileSync('unzip', ['-p', path.join(here, 'redbean.com'), 'tmpl/index.fmg'], { encoding: 'utf8' }); } catch (e) { /* no unzip */ }
  if (zipped !== null) assert.equal(zipped, read('tmpl/index.fmg'), 'redbean.com has the same tmpl/index.fmg');
});

test('negative: no template needs eval - no hx-on, js:/javascript: values, trigger filters or scripts', () => {
  const dir = path.join(here, 'tmpl');
  for (const f of fs.readdirSync(dir)) {
    const s = fs.readFileSync(path.join(dir, f), 'utf8').replace(/^\s*--.*$/gm, ''); // Lua comments are not markup
    assert.doesNotMatch(s, /hx[-_]on|\[\s*["']on[:-]|\bon[_-]\w+\s*=|hx-vals|vals\s*=|js:|javascript:|trigger\s*=\s*"[^"]*\[/i, f);
    assert.doesNotMatch(s, /\{%=/, `${f}: output goes through {%& %} or fmg, which escape`);
  }
});

test('in a DOM, htmx reads the escaped meta and does not run a script from a response', { skip: !process.env.JSDOM && 'set JSDOM' }, async () => {
  const { JSDOM } = require(process.env.JSDOM);
  const src = read('assets/htmx.js');
  const run = async withMeta => {
    const meta = withMeta ? '<meta name="htmx-config" content="{&quot;allowEval&quot;:false,&quot;allowScriptTags&quot;:false}">' : '';
    const dom = new JSDOM(`<!doctype html><html><head>${meta}</head><body><button id=b hx-get="/x" hx-target="#t">go</button><div id=t></div></body></html>`,
      { runScripts: 'dangerously', url: 'http://localhost/' });
    const w = dom.window; w.ran = false;
    w.XPathEvaluator = class { createExpression() { return { evaluate() { return { iterateNext() { return null; } }; } }; } };
    w.XMLHttpRequest = class {
      constructor() { this.upload = { addEventListener() {} }; }
      addEventListener() {} open() {} setRequestHeader() {} overrideMimeType() {}
      getAllResponseHeaders() { return ''; } getResponseHeader() { return null; }
      send() {
        Object.assign(this, { status: 200, readyState: 4, responseURL: 'http://localhost/x' });
        this.response = this.responseText = '<p>x</p><script>window.ran=true</script>';
        setTimeout(() => this.onload && this.onload(), 0);
      }
    };
    const s = w.document.createElement('script'); s.textContent = src; w.document.head.appendChild(s);
    w.htmx.process(w.document.body);
    w.document.getElementById('b').click();
    await new Promise(r => setTimeout(r, 300));
    return { config: w.htmx.config, swapped: !!w.document.querySelector('#t p'), ran: w.ran };
  };
  const on = await run(true);
  assert.equal(on.config.allowEval, false);
  assert.equal(on.config.allowScriptTags, false);
  assert.equal(on.swapped, true);
  assert.equal(on.ran, false);
  const off = await run(false); // the control: without the meta the script runs
  assert.equal(off.ran, true);
});
