//@ compile-flags: -Ztypeck
contract C {
    string constant x = "abc"; //~ ERROR: mismatched types
    function f() public pure {
        assembly {
            let a := x
        }
    }
}
