//@ compile-flags: -Ztypeck
contract Foo {
    uint constant y; //~ ERROR: constant variable must be initialized
}
