package haxe.ui.validators;

/**
    Replaces haxeui-core's EmailValidator, whose pattern
    ^[^\-@\s:&!\/\\]+([\.-]?[^@\s:&!\/\\]+)*@[^\-@\s:&!\/\\\.]+([\.-]?[^@\s:&!\/\\\.]+)*(\.[^\-@\s:&!\/\\\.]{2,})+$
    nests a "+" inside a "*" over overlapping character classes, so a
    string such as "a@aaaa...!" backtracks exponentially (ReDoS, CodeQL
    js/redos). haxeui-core master still has that pattern.

    html5.hxml adds -cp src after the -lib lines; Haxe searches the class
    path added last first, so this file is compiled instead of the
    library's.

    The pattern below accepts exactly the same addresses:
    - local part: X+([.-]?Y+)* where X is Y without "-", and "." and "-"
      are in Y, is the same as one X followed by any number of Y;
    - domain: D+([.-]?E+)*(\.D{2,})+, where "-" is in E and D is E
      without "-", is the same as one D, then any number of E each
      optionally preceded by ".", then a final "." and two or more D.
    Each part now has only one way to match a given string, so matching
    is linear.
**/
class EmailValidator extends PatternValidator {
    public function new() {
        super();
        invalidMessage = "Invalid email address";
        pattern = ~/^[^\-@\s:&!\/\\][^@\s:&!\/\\]*@[^\-@\s:&!\/\\\.](?:\.?[^@\s:&!\/\\\.])*\.[^\-@\s:&!\/\\\.]{2,}$/gm;
    }
}
