//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        address payable a = address(new D()); //~ ERROR: mismatched types

        // This conversion makes no sense anyway.
        address payable b = address(D); //~ ERROR: invalid explicit type conversion
    }
}

contract D {
    receive() external payable {
    }
}
