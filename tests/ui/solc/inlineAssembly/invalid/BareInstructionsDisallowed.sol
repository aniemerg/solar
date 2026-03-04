//@ compile-flags: -Ztypeck
contract C {
    function f() view public {
        assembly {
            address
            pop //~ ERROR: expected one of `(`, `,`, or `:=`, found Yul EVM builtin keyword `pop`
        }
    }
}
