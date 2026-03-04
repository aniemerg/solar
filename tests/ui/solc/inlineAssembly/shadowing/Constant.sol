//@ compile-flags: -Ztypeck
contract C {
    uint constant a; //~ ERROR: constant variable must be initialized
    function f() public pure {
        assembly {
            let a := 1
        }
    }
}
