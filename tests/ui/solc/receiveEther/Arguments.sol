contract C {
    receive(uint256) external payable {} //~ ERROR: receive ether function cannot take parameters
}
