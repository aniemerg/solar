contract test {
    function f(uint x) pure public {
        uint y = +x; //~ ERROR: unary plus is not supported
        y;
    }
}
