//@ compile-flags: -Ztypeck
library B {
    function b() public {}
}

contract A {
    using B for bytes;

    function a() public {
        bytes memory x;
        x.b(); //~ ERROR: member `b` not found on type `bytes memory`
    }
}
