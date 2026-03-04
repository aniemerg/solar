contract C {
    uint x;
    receive() external pure { x = 2; } //~ ERROR: `pure` not allowed here; allowed values: payable
}
