contract C {
    function f() public pure {
        address payable a = address payable(this); //~ ERROR: `address payable` cannot be used in an expression
    }
}
