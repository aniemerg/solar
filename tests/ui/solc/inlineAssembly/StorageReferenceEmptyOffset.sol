//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        assembly {
            let x := .offset //~ ERROR: expected one of literal or path, found `.`
        }
    }
}
