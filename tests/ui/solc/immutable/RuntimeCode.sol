//@ compile-flags: -Ztypeck
contract A {
    address public immutable user = address(0x0); //~ ERROR: invalid explicit type conversion
}

contract Test {
    function test() public pure returns(bytes memory) {
        return type(A).runtimeCode;
    }
}
