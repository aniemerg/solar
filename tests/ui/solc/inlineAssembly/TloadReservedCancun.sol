//@ compile-flags: -Ztypeck
contract C {
    function f() public view returns (uint ret) {
        assembly {
            let tload := sload(0) //~ ERROR: expected identifier, found Yul EVM builtin keyword `tload`
            ret := tload //~ ERROR: expected identifier, found Yul EVM builtin keyword `tload`
        }
    }
}
