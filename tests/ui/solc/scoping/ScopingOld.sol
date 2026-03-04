contract test {
    function f() pure public {
        x = 4; //~ ERROR: unresolved symbol `x`
        uint256 x = 2;
    }
}
