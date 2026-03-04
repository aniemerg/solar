//@ compile-flags: -Ztypeck
contract test {
    function f() public {
        assembly {
            1 //~ ERROR: expected one of `break`, `continue`, `for`, `function`, `if`, `leave`, `let`, `switch`, `{`, `}`, or identifier, found `<integer>`
        }
    }
}
