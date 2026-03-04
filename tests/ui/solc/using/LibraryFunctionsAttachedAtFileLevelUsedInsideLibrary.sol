//@ compile-flags: -Ztypeck
using {L.externalFunction, L.publicFunction, L.internalFunction} for uint;

library L {
    function externalFunction(uint) external pure {}
    function publicFunction(uint) public pure {}
    function internalFunction(uint) internal pure {}

    function f() public pure {
        uint x;
        x.externalFunction(); //~ ERROR: member `externalFunction` not found on type `uint256`
        x.publicFunction(); //~ ERROR: member `publicFunction` not found on type `uint256`
        x.internalFunction(); //~ ERROR: member `internalFunction` not found on type `uint256`
    }
}
