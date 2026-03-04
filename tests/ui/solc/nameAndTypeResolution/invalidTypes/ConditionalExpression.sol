//@ compile-flags: -Ztypeck
contract C {
    function o(bytes1) public pure {}
    function f() public {
        o(true ? 99**99 : 99); //~ ERROR: mismatched types
//~^ ERROR: mismatched types
//~^^ ERROR: mismatched types
        o(true ? 99 : 99**99); //~ ERROR: mismatched types
//~^ ERROR: mismatched types
//~^^ ERROR: mismatched types

        o(true ? 99**99 : 99**99); //~ ERROR: mismatched types
//~^ ERROR: mismatched types
//~^^ ERROR: mismatched types
    }
}
