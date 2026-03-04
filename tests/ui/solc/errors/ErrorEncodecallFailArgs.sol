//@ compile-flags: -Ztypeck
error MyCustomError(uint, bool);
contract C {
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
        abi.encodeCall(this.f1, (MyCustomError, MyCustomError)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.f2, (MyCustomError)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.f3, (MyCustomError)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.g1, (MyCustomError)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.g2, (MyCustomError)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.h, (MyCustomError)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.i, (MyCustomError)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.j, (MyCustomError)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.k, (MyCustomError)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.l, (MyCustomError)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
