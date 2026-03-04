//@ compile-flags: -Ztypeck
contract A {
    uint[] x;
}

contract B is A {
    function g() public pure returns (uint) {
        return A.x.length; //~ ERROR: member `x` not found on type `type(contract A)`
    }
    function h() public pure returns (uint) {
        return A.x[2]; //~ ERROR: member `x` not found on type `type(contract A)`
    }
}
