//@ compile-flags: -Ztypeck
contract C {
    function f() public view returns (uint ret) {
        assembly {
            let blobbasefee := sload(0) //~ ERROR: expected identifier, found Yul EVM builtin keyword `blobbasefee`
            ret := blobbasefee //~ ERROR: expected identifier, found Yul EVM builtin keyword `blobbasefee`
        }
    }
}
