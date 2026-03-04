//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        (bool success, ) = address(10).staticcall{gas: 3}(""); //~ ERROR: invalid explicit type conversion
//~^ ERROR: mismatched number of components
        success;
    }
}
