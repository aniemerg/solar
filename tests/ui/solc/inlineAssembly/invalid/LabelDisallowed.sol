//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        assembly {
            label: //~ ERROR: expected one of `(`, `,`, or `:=`, found `:`
        }
    }
}
