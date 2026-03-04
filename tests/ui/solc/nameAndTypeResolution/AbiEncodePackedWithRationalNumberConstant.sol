//@ compile-flags: -Ztypeck
contract C {
    function f() pure public { abi.encodePacked(0/1); } //~ ERROR: wrong argument count for function call: 1 arguments given but expected 0
}
