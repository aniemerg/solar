//@ compile-flags: -Ztypeck
contract Test {
    function runtime() public pure returns (bytes memory) {
        return type(Other).runtimeCode; //~ ERROR: member `runtimeCode` not found on type `type(contract Other)`
    }
}
abstract contract Other {
    function f(uint) public returns (uint); //~ ERROR: functions without implementation must be marked virtual
}
