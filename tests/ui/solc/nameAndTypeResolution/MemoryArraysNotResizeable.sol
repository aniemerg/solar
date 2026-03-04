//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        uint[] memory x;
        x.length = 2; //~ ERROR: member `length` is read-only and cannot be used to resize arrays
    }
}
