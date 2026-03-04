//@ compile-flags: -Ztypeck
struct S {
    function () f;
}

contract C {
    enum testEnum { choice1, choice2, choice3 }

    function f1(uint8) external {}
    function f2(uint32) external {}
    function f3(uint) external {}
    function g1(bytes memory) external {}
    function g2(bytes32) external {}
    function h(string memory) external {}
    function i(bool) external {}
    function j(address) external {}
    function k(address payable) external {}
    function l(testEnum) external {}

    function main() external view {
        S memory s;
        abi.encodeCall(this.f1, (s)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.f2, (s)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.f3, (s)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.g1, (s)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.g2, (s)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.h, (s)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.i, (s)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.j, (s)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.k, (s)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.l, (s)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
