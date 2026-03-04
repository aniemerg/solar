contract test {
    function f() public {
        {
            uint256 x;
        }
        x = 2; //~ ERROR: unresolved symbol `x`
    }
}
