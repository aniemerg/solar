//@ compile-flags: -Ztypeck
interface testInterface {
    function A(address payable) external;
}

contract testContract {
    function main() external view {
        abi.encodeCall(testInterface.A, (address(0))); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
//~^ ERROR: member `A` not found on type `type(contract testInterface)`
//~^^ ERROR: invalid explicit type conversion
    }
}
