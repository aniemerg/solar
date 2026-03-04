//@ compile-flags: -Ztypeck
library L {
}
contract C {
    function f() public pure returns (address payable) {
        return address(L); //~ ERROR: invalid explicit type conversion
    }
}
