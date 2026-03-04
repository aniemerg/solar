//@ compile-flags: -Ztypeck
contract C {
    function f() public pure returns (uint ret) {
        assembly {
            function blobhash() -> r { //~ ERROR: expected identifier, found Yul EVM builtin keyword `blobhash`
                r := 1000
            }
            ret := blobhash()
        }
    }
}
