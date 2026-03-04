//@compile-flags: -Ztypeck
contract test {
    function f() public pure {

        fixed a = 0.42578125 % -0.4271087646484375; //~ ERROR: rational literals are not supported
//~^ ERROR: rational literals are not supported
        fixed b = .5 % a; //~ ERROR: rational literals are not supported
        fixed c = a % b; //~ ERROR: cannot apply builtin operator `%` to `fixed256x0` and `fixed256x0`
        a; b; c;
    }
}
