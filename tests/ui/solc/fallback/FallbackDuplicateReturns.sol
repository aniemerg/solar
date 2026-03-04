contract C {
    fallback(bytes calldata _input) external returns (bytes memory _output) {}
    fallback() external {} //~ ERROR: fallback function already declared
}
