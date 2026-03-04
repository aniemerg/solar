//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        abi.encodeWithSelector();
        abi.encodeWithSignature();
        abi.encodeWithSelector(uint(2), 2); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeWithSignature(uint(2), 2); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
