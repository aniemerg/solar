//@ compile-flags: -Ztypeck
contract C {
    event MyCustomEvent(uint);

    enum testEnum { choice1, choice2, choice3 }

    function f1(uint8, uint8) external {}
    function f2(uint32) external {}
    function f3(uint) external {}
    function g1(bytes memory) external {}
    function g2(bytes32) external {}
    function h(string memory) external {}
    function i(bool) external {}
    function j(address) external {}
    function k(address payable) external {}
    function l(testEnum) external {}

    function f() pure public {
        abi.encodeCall(this.f1, (MyCustomEvent, MyCustomEvent)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.f2, (MyCustomEvent)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.f3, (MyCustomEvent)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.g1, (MyCustomEvent)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.g2, (MyCustomEvent)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.h, (MyCustomEvent)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.i, (MyCustomEvent)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.j, (MyCustomEvent)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.k, (MyCustomEvent)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.l, (MyCustomEvent)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
