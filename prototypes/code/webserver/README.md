## Hello World webserver benchmarks

- These are hobby benchmarks of buggy example code. Please do your own tests to be sure.
- Benchmarks are done on Ryzen laptop that has Kubuntu and 8 GB RAM.
- Most examples are based on code from [Rosetta code Hello world webserver](https://www.rosettacode.org/wiki/Hello_world/Web_server)
- Also see [TechEmpower Web Framework Benchmarks](https://www.techempower.com/benchmarks/)
- Other examples are from programming language or web framework websites.
- Only small code examples are included here. Not full example apps.
- Too much console output during test slows down server, that could should be commented out sometime.
- [Feedback email address](https://wekan.team/commercial-support/)

## Results

Webserver | Req/sec | Transfer/sec MB | Notes
------------ | ------------- | ------------- | -------------
[Asm rwasa](https://2ton.com.au/rwasa/) - [HN](https://news.ycombinator.com/item?id=9948749) | 201990,31 | 59,91
[Go](https://go.dev/dl/) | 116404,52 | 21,11 |
[Drogon](https://github.com/drogonframework/drogon) | 82914,92 | 11,94 | error
[Asm httpd](https://github.com/nemasu/asmttpd) | 63314,12 | 11.17 |
[Caddy 2](https://caddyserver.com/docs/quick-starts/static-files) | 57490,23 | 12,50 |
[Apache 2.4.52 mod-php 8.1.3](https://github.com/wekan/hx/blob/main/prototypes/code/webserver/works/php8.1/index.php) | 38446,94 | 5,84 |
[Java jlhttp](http://www.freeutils.net/source/jlhttp/) | 38620,13 | 5,86 |
[REBOL/Core 2.7](http://www.rebol.com/downloads.html) | 35263,12 | 5.35 |
[Redbean 1.5 demo](https://redbean.dev) | 31684,95 | 25,23 | too much console output
[Crystal](https://crystal-lang.org) | 24835,22 | 2,56 |
[Node.js 16.14.0](https://nodejs.org) | 23730,23 | 4,16 |
[Node.js 17.6.0](https://nodejs.org) | 23654,95 | 4,15 |
[Node.js 14.19.0](https://nodejs.org) | 21795,21 | 3,82 |
[Redbean 1.5](https://redbean.dev) | 17768,00 | 106,81 | too much console output
[V](https://github.com/vlang/v) | 15314,32 | 3,94 | Using vweb
[Tcl](http://kitcreator.rkeene.org/kitcreator) - [wiki](https://wiki.tcl.tk) | 10070,64 | 769,63	|
[FreePascal](https://wiki.freepascal.org/Portal:Web_Development) | 7950,49 | 714,32 |
[Python 3.9.7](https://docs.aiohttp.org/en/stable/web_quickstart.html) | 7286,96 | 1,13 |
[Fullmoon](https://github.com/pkulchenko/fullmoon) | 5118,11 | 8,33 | too much console output
[Rust Rocket](https://rocket.rs) | 4846,00 | 1,10 | too much console output
C | 3348,55 | 13,20 |
[WeKan Meteor](https://wekan.github.io) | 1339,23 | 1,76 |
[Bacon Basic](https://www.basic-converter.org) | 101,67 | 11,91 |
Ada | | | notwork
Java | | | notwork
Julia | | | notwork
Nim | | | notwork
Mono | | | notwork
OCaml | | | notwork
PHP | | | notwork
Python | | | notwork
