//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        assembly {
            let x.offset := 1 //~ ERROR: expected one of `,`, `:=`, `break`, `continue`, `for`, `function`, `if`, `leave`, `let`, `switch`, `{`, `}`, or identifier, found `.`
            let x.slot := 1
        }
    }
}
