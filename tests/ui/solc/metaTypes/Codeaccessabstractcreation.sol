//@ compile-flags: -Ztypeck
contract Test {
    function creationOther() public pure returns (bytes memory) {
        return type(Other).creationCode; //~ ERROR: member `creationCode` not found on type `type(contract Other)`
    }
}
abstract contract Other {
    function f(uint) public returns (uint); //~ ERROR: functions without implementation must be marked virtual
}
