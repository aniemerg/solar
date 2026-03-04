//@ compile-flags: -Ztypeck
contract C {
    function f() public view returns (uint ret) {
        assembly {
            let basefee := sload(0) //~ ERROR: expected identifier, found Yul EVM builtin keyword `basefee`
            ret := basefee //~ ERROR: expected identifier, found Yul EVM builtin keyword `basefee`
        }
    }
}
