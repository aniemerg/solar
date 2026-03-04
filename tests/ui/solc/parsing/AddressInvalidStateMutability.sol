//@ compile-flags: -Ztypeck
contract C {
    address view m_a; //~ ERROR: address types can only be payable or non-payable
    address pure m_b; //~ ERROR: address types can only be payable or non-payable
    address view[] m_c; //~ ERROR: address types can only be payable or non-payable
    mapping(uint => address view) m_d; //~ ERROR: address types can only be payable or non-payable
    function f() public pure {
        address view a; //~ ERROR: address types can only be payable or non-payable
//~^ ERROR: expected one of `(`, `.`, `;`, `?`, `[`, or `{`, found `a`
        address pure b;
        a; b;
    }
    function g(address view) public pure {}
    function h(address pure) public pure {}
    function i() public pure returns (address view) {}
    function j() public pure returns (address pure) {}
    modifier m1(address view) {_;}
    modifier m2(address pure) {_;}
    event e1(address view);
    event e2(address pure);
    error err1(address view);
    error err2(address pure);
    function f2() public pure returns (address) {
        try this.f2() returns (address view res) {} catch {}
    }
    function f3() public pure returns (address) {
        try this.f3() returns (address pure res) {} catch {}
    }
}
address view constant f_a;
address pure constant f_b;
