//@ compile-flags: -Ztypeck
contract Base {
    address public immutable user = address(0x0); //~ ERROR: invalid explicit type conversion
}

contract Derived is Base {}

contract Test {
    function test() public pure returns(bytes memory) {
        return type(Derived).runtimeCode;
    }
}
