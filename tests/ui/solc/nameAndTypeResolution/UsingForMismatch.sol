//@ compile-flags: -Ztypeck
library D { function double(bytes32 self) public returns (uint) { return 2; } }
contract C {
    using D for uint;
    function f(uint a) public returns (uint) {
        return a.double(); //~ ERROR: member `double` not found on type `uint256`
    }
}
