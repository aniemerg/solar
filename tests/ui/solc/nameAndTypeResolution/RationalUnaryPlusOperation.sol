//@ compile-flags: -Ztypeck
contract test {
    function f() pure public {
        ufixed16x2 a = +3.25; //~ ERROR: unary plus is not supported
        fixed16x2 b = -3.25;
        a; b;
    }
}
