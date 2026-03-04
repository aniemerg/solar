//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        uint mload;
        assembly {
            mload := 1 //~ ERROR: expected identifier, found Yul EVM builtin keyword `mload`
        }
    }
}
