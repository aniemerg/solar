//@ compile-flags: -Ztypeck
contract C {
    function f() public view {
        assembly {
            // NOTE: All EVM instruction names are reserved identifiers in Yul.
            // NOTE: We do provide builtins corresponding to these instructions.
            function add(mstore) -> sstore {} //~ ERROR: expected identifier, found Yul EVM builtin keyword `add`
//~^ ERROR: expected identifier, found Yul EVM builtin keyword `mstore`
//~^^ ERROR: expected identifier, found Yul EVM builtin keyword `sstore`
            let coinbase //~ ERROR: expected identifier, found Yul EVM builtin keyword `coinbase`
        }
    }
}
