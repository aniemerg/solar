// This used to work pre-0.6.0.
library L {
    function f() public returns(uint[] storage);
    function g() public returns(uint[] storage s);
}
abstract library T { //~ ERROR: expected `contract`, found keyword `library`
    function f() public returns(uint[] storage);
    function g() public returns(uint[] storage s);
}
