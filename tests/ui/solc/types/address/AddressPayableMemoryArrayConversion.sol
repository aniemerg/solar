//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        address payable[] memory a = new address payable[](4); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
        address[] memory b = new address[](4); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
        a = b; //~ ERROR: mismatched types
        b = a; //~ ERROR: mismatched types
    }
}
