//@ compile-flags: -Ztypeck
library L {
    function f1(uint[] transient) private pure { } //~ ERROR: expected data location
    function f2() private pure returns (uint[] transient) { } //~ ERROR: expected data location
    function g1(uint[] transient) internal pure { } //~ ERROR: expected data location
    function g2() internal pure returns (uint[] transient) { } //~ ERROR: expected data location
    function h1(uint[] transient) public pure { } //~ ERROR: expected data location
    function h2() public pure returns (uint[] transient) { } //~ ERROR: expected data location
    function i1(uint[] transient) external pure { } //~ ERROR: expected data location
    function i2() external pure returns (uint[] transient) { } //~ ERROR: expected data location
}
