//@ compile-flags: -Ztypeck
contract A {
    enum Foo {
        First,
        Second
    }

    function a() public {
        A.Foo; //~ ERROR: member `Foo` not found on type `type(contract A)`
    }
}
