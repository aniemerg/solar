//@ compile-flags: -Ztypeck
contract D {
    constructor(function() external pure returns (uint) ) {
    }
}

library L {
    function f() public pure returns (uint) {
        return 5;
    }
}

contract C {
    function f() public returns (uint r) {
        // An assert used to fail if the function types are not exactly equal (pure, view) v/s
        // default
        // ok
        new D(this.testPure); //~ ERROR: mismatched types
        // not okay
        new D(this.testView); //~ ERROR: mismatched types
        // not okay
        new D(this.testDefault); //~ ERROR: mismatched types
        // not okay
        new D(this.testDifferentSignature); //~ ERROR: mismatched types
        // not okay
        new D(gasleft); //~ ERROR: mismatched types
        // not okay
        new D(L.f); //~ ERROR: member `f` not found on type `type(library L)`
        // not okay
        new D(testInternalFunction); //~ ERROR: mismatched types
        // not okay
        new D(this.testInternalFunction); //~ ERROR: member `testInternalFunction` not found on type `contract C`
    }

    function testPure() public pure returns (uint) {
    }

    function testView() public view returns (uint) {
        block.timestamp;
    }

    function testDefault() public returns (uint) {
        selfdestruct(payable(address(this)));
    }

    function testDifferentSignature(uint a) public pure returns (uint) {
    }

    function testInternalFunction() internal pure returns (uint) {
        return 10;
    }
}
