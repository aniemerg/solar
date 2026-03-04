//@ compile-flags: -Ztypeck
contract C {
    function foo() pure internal {
        address(10).staticcall{value: 7, gas: 3}(""); //~ ERROR: invalid explicit type conversion
    }
}
