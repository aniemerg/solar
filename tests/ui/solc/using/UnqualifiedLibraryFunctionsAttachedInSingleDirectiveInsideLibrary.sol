//@ compile-flags: -Ztypeck
library L {
    function externalFunction(uint) external pure {}
    function publicFunction(uint) public pure {}
    function internalFunction(uint) internal pure {}
    function privateFunction(uint) private pure {}

    using {externalFunction, publicFunction, internalFunction, privateFunction} for uint;

    function f() public pure {
        uint x;
        x.externalFunction(); //~ ERROR: member `externalFunction` not found on type `uint256`
        x.publicFunction(); //~ ERROR: member `publicFunction` not found on type `uint256`
        x.internalFunction(); //~ ERROR: member `internalFunction` not found on type `uint256`
        x.privateFunction(); //~ ERROR: member `privateFunction` not found on type `uint256`
    }
}
