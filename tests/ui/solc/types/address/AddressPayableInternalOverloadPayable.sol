//@ compile-flags: -Ztypeck
contract C {
    function f(address payable) internal pure {}
    function f(address) internal pure {}
    function g() internal pure {
        address payable a = payable(0); //~ ERROR: invalid explicit type conversion
        f(a); //~ ERROR: no matching declarations found
    }
}
