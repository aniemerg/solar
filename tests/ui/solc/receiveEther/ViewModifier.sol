contract C {
    uint x;
    receive() external view { x = 2; } //~ ERROR: `view` not allowed here; allowed values: payable
}
