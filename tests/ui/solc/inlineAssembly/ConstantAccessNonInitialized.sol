//@ compile-flags: -Ztypeck
contract C {
    uint constant x; //~ ERROR: constant variable must be initialized
    function f() public pure {
        assembly {
            let c1 := x
        }
    }
}
