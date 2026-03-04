contract C {
    uint[] s;
    modifier mod(uint[] storage b) {
        b[0] = 0;
        _;
    }
    function f() mod(a) internal returns (uint[] storage a) //~ ERROR: unresolved symbol `a`
    {
		a = s;
    }
}
