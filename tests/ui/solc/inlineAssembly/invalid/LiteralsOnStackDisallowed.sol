//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        assembly {
            1 //~ ERROR: expected one of `break`, `continue`, `for`, `function`, `if`, `leave`, `let`, `switch`, `{`, `}`, or identifier, found `<integer>`
        }
    }
}
