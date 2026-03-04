//@ compile-flags: -Ztypeck
contract C {
    struct S { uint a; }
    function f() public pure returns(address) {
        S memory s = S(42);
        return s.address; //~ ERROR: member `address` not found on type `struct C.S memory`
    }
}
