//@ compile-flags: -Ztypeck
contract test {
    function f1(uint immutable a) public returns (uint immutable) { } //~ ERROR: mutability is not allowed here
//~^ ERROR: mutability is not allowed here
    function f2(uint constant a) public returns (uint constant) { } //~ ERROR: mutability is not allowed here
//~^ ERROR: mutability is not allowed here
}
