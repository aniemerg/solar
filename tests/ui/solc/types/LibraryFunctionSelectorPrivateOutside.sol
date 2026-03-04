//@ compile-flags: -Ztypeck
library L {
    function f(uint256) private {}
}
contract C {
    function f() public pure returns (bytes4) {
        return L.f.selector; //~ ERROR: member `f` not found on type `type(library L)`
    }
}
