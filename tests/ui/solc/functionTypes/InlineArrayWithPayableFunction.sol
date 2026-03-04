//@ compile-flags: -Ztypeck
contract D {
    function f(uint a) external payable {}
    function g(uint a) external {}
}

contract C {
    function f() public {
        D d;
        [d.f{value: 1}, d.g][0](8); //~ ERROR: call options must be part of a call expression
    }
}
