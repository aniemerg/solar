contract C {
    function f() public pure {
        assembly {
            let x := hex"12__34"; //~ ERROR: invalid underscore in hex literal
//~^ ERROR: expected one of `break`, `continue`, `for`, `function`, `if`, `leave`, `let`, `switch`, `{`, `}`, or identifier, found `;`

        }
    }
}
