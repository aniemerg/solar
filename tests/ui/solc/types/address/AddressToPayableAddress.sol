//@ compile-flags: -Ztypeck
contract C {
    function f(address a) public pure {
        address b;
        address payable c = a; //~ ERROR: mismatched types
        c = b; //~ ERROR: mismatched types
    }
}
