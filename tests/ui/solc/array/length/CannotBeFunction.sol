contract C {
    function f() public {}
    uint[f] ids; //~ ERROR: failed to evaluate constant: only constant variables are allowed
}
