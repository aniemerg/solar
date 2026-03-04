contract C {
    uint[] s;
    modifier mod(uint[] storage b) {
        _;
        b[0] = 0;
    }
    function f() mod(a) internal returns (uint[] storage a) //~ ERROR: unresolved symbol `a`
    {
		a = s;
    }
}
