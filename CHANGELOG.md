# Upcoming Wekan.hx release

This release fixes the following security issues found by Dependabot and
GitHub CodeQL code scanning:

- [Node.js prototype: dompurify 3.5.0, qs 6.17.1 and jszip 3.10.2](https://github.com/wekan/hx/commit/02e5451edbc4e4c506ad14a030629aa06153af02).
  Thanks to xet7.
- [Node.js prototype: brace-expansion, minimatch, semver, tar-fs and tmp updated in the lockfile](https://github.com/wekan/hx/commit/6c017ad0f08f58f5b24f28424d8d03606ea0d1a4).
  Thanks to xet7.
- [Node.js prototype: overrides for path-to-regexp (page), uuid (exceljs) and katex (mermaid)](https://github.com/wekan/hx/commit/10c8df21a45ecda6eb04eed2d98e565092f8ca5b),
  whose dependents pin vulnerable ranges. Thanks to xet7.
- [fullmoon prototype: htmx 1.8.4 updated to 2.0.11](https://github.com/wekan/hx/commit/48d3d17be2f4703ed17ca7b76b4220e736019755).
  Thanks to xet7.
- [HTML5 prototype: a linear email pattern replaces haxeui-core's backtracking one, and Main.js is rebuilt](https://github.com/wekan/hx/commit/f78dbb0d9830633c6d483ab67530fb489b8acff5).
  Thanks to xet7.

and adds the following improvements:

- [Moved static version to tests/static](https://github.com/wekan/hx/commit/68015a67380927ac0db05abcb5a5c56abe268bda).
  Thanks to xet7.
- [Added some required files from php prototype and meteor Wekan to Wekan.hx
  prototype](https://github.com/wekan/hx/commit/12017ae6097adaa9825827ef0b5f3e55bf643fee).
  Thanks to xet7.
- [Added more tests](https://github.com/wekan/hx/commit/facc632fd994db35631b86e78fe9bb8a47d60550).
  Thanks to xet7.
- [Added scripts to install haxelibs](https://github.com/wekan/hx/commit/6a5488606c961fdaeb5a7aaf09f9d62f47cfdf59).
  Thanks to xet7.
- [Added tinkweb tests for Node.js and PHP](https://github.com/wekan/hx/commit/fe2984ae9b86b3dec00218ce633da41ab9424e25).
  Thanks to xet7.
- [More tinkweb and hello tests with Haxe](https://github.com/wekan/hx/commit/adf692dabe407ad9b3cbfa630226ee7e36741656).
  Thanks to xet7.
- [Added lua to hello tests](https://github.com/wekan/hx/commit/33142f53ad89198fbb200af3893cbbee9aa630b6).
  Thanks to xet7.
- [Added jvm to hello tests](https://github.com/wekan/hx/commit/53b55bf953e975b5c417bc62b7a0c796a3531247).
  Thanks to xet7.
- [Added HashLink. Tried to add also HashLink/C, but did not get that working](https://github.com/wekan/hx/commit/bcd6b721beeb56dcf74a7416c5449902887ceba5).
  Thanks to xet7.

Thanks to above GitHub users for their contributions and translators for their translations.

# 2018-05-28 v0.01 Wekan.hx release

This release adds the following new features:

* Static website version: index of pages, login, boardlist, boardlist with 2 starred boards.
* Minimal Python webserver at pyserver.sh, to test website at http://localhost:8000

Thanks to GitHub user xet7 for contributions.

