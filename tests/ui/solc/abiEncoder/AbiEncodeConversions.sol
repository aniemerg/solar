//@ compile-flags: -Ztypeck
interface testInterface {
    function C(function (string memory) external) external;
    function D(string calldata) external;
    function E(string memory) external;
    function F(address) external;
}

contract testContract {
    function g(string calldata) external {}
    function h(string memory) external {}
    function i(string calldata str) external {
        this.h(str);
        this.g(str);
    }
    function j(string memory str) external {
        this.h(str);
        this.g(str);
    }
    function k(string memory str) external pure {
        abi.encodeCall(testInterface.D, (str)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: member `D` not found on type `type(contract testInterface)`
    }
    string s;

    function main() external view {
        abi.encodeCall(testInterface.C, (this.g)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: member `C` not found on type `type(contract testInterface)`
        abi.encodeCall(testInterface.C, (this.h)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: member `C` not found on type `type(contract testInterface)`
        abi.encodeCall(testInterface.D, (s)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: member `D` not found on type `type(contract testInterface)`
        abi.encodeCall(testInterface.E, (s)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: member `E` not found on type `type(contract testInterface)`
        abi.encodeCall(testInterface.F, (payable(address(0)))); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: member `F` not found on type `type(contract testInterface)`
//~^^ ERROR: invalid explicit type conversion
        abi.encodeCall(this.i, (s)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
        abi.encodeCall(this.j, (s)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
