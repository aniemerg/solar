//@ compile-flags: -Ztypeck
library L1 {
    using L1 for *;
    function f() public pure returns (uint r) { return r.g(); } //~ ERROR: member `g` not found on type `uint256`
    function g(uint) public pure returns (uint) { return 2; }
}

library L2 {
    using L1 for *;
    function f() public pure returns (uint r) { return r.g(); } //~ ERROR: member `g` not found on type `uint256`
    function g(uint) public pure returns (uint) { return 2; }
}
