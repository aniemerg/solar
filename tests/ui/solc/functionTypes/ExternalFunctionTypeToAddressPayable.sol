//@ compile-flags: -Ztypeck
contract C {
    function f() public view returns (address payable) {
        return this.f.address; //~ ERROR: member `address` not found on type `function () view returns (address payable)`
    }
}
