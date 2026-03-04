//@ compile-flags: -Ztypeck
contract C {
    enum small { A, B, C, D }
    enum big { A, B, C, D }

    function f() public {
        small x;
        big y;

        true ? x : y; //~ ERROR: incompatible conditional types
    }
}
