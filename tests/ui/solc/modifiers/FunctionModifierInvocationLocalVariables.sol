contract B {
    function f() mod(x) pure public { uint x = 7; } //~ ERROR: unresolved symbol `x`
    modifier mod(uint a) { if (a > 0) _; }
}
