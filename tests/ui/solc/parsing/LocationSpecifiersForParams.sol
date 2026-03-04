//@ compile-flags: -Ztypeck
contract Foo {
    function f(uint[] storage constant x, uint[] memory y) internal { } //~ ERROR: mutability is not allowed here
}
