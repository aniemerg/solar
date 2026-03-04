//@ compile-flags: -Ztypeck
contract C {
    function f() external view returns (uint a) {
        assembly {
            a := tload(0)
        }
    }
}
