contract test {
    function f() pure public {
        uint x;
        uint x; //~ ERROR: identifier `x` already declared
    }
}
