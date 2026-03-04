//@ compile-flags: -Ztypeck
contract C {
    string[] s;
    function f() public pure {
        string[] memory m;
        abi.encodePacked(m); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
    }
    function g() public pure {
        abi.encodePacked(s); //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
    }
}
