//@ compile-flags: -Ztypeck
interface testInterface {
    function B(function (string calldata) external) external;
}

contract testContract {
    function g(string calldata) external {}
    function h(string memory) external {}

    function main() external view {
        abi.encodeCall(testInterface.B, (this.g)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: member `B` not found on type `type(contract testInterface)`
        abi.encodeCall(testInterface.B, (this.h)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: member `B` not found on type `type(contract testInterface)`
    }
}
