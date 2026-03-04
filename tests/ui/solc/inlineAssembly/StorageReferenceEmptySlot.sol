//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        assembly {
            let x := .slot //~ ERROR: expected one of literal or path, found `.`
        }
    }
}
