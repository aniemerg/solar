contract C {
    uint constant LEN = LEN;
    function f() public {
        uint[LEN] a; //~ ERROR: failed to evaluate constant: recursion limit reached
    }
}
