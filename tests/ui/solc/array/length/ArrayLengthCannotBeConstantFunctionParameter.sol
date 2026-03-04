contract C {
    function f(uint constant LEN) public { //~ ERROR: mutability is not allowed here
        uint[LEN] a;
    }
}
