//@ compile-flags: -Ztypeck
contract Foo {
    function changeIt() public { x = 9; } //~ ERROR: cannot assign to a constant variable
    uint constant x = 56;
}
