//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        uint returndatasize;
        returndatasize;
        assembly {
            returndatasize := 2 //~ ERROR: expected identifier, found Yul EVM builtin keyword `returndatasize`
        }
    }
}
