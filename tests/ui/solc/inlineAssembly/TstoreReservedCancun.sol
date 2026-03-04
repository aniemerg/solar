//@ compile-flags: -Ztypeck
contract C {
    function f() public view returns (uint ret) {
        assembly {
            let tstore := sload(0) //~ ERROR: expected identifier, found Yul EVM builtin keyword `tstore`
            ret := tstore //~ ERROR: expected identifier, found Yul EVM builtin keyword `tstore`
        }
    }
}
