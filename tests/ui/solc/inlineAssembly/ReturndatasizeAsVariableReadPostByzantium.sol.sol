//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        uint returndatasize;
        returndatasize;
        assembly {
            let x := returndatasize //~ ERROR: expected identifier, found Yul EVM builtin keyword `returndatasize`
        }
    }
}
