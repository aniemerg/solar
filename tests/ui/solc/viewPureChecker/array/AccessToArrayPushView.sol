//@ compile-flags: -Ztypeck
contract A {
    uint[] x;
    function f() public view returns (uint) {
        return x.push(); //~ ERROR: member `push` not unique on type `uint256[] storage`
    }
}
