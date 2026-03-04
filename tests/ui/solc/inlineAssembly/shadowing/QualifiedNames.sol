//@ compile-flags: -Ztypeck
contract D {
    uint constant a; //~ ERROR: constant variable must be initialized
}
contract C {
    function f() public pure {
        assembly {
            let D.a := 1 //~ ERROR: expected one of `,`, `:=`, `break`, `continue`, `for`, `function`, `if`, `leave`, `let`, `switch`, `{`, `}`, or identifier, found `.`
            let D.b := 1 // shadowing the prefix only is also an error
        }
    }
}
