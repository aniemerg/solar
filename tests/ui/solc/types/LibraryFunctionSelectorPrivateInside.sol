//@ compile-flags: -Ztypeck
library L {
    function f(uint256) private {}
    function g(uint256) public returns (uint256) {
        return f.selector; //~ ERROR: member `selector` not found on type `function (uint256)`
    }
}
