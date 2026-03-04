//@ compile-flags: -Ztypeck
contract C {
    struct S { uint a; }
    S m_x;
    uint[] m_y;
    function f() view public {
        S x = m_x; //~ ERROR: expected data location
        uint[] y = m_y; //~ ERROR: expected data location
        x; y;
    }
}
