//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        uint mload;
        assembly {
            let x := mload //~ ERROR: expected identifier, found Yul EVM builtin keyword `mload`
        }
    }
}
