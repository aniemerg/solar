//@ compile-flags: -Ztypeck
abstract contract I {
    function a() internal view virtual returns(uint256);
}

abstract contract C is I {
    function f() public view returns(uint256) {
        return I.a(); //~ ERROR: member `a` not found on type `type(contract I)`
    }
}

abstract contract D is I {
    function f() public view returns(uint256) {
        return super.a(); //~ ERROR: member `a` not found on type `contract D`
    }
}
