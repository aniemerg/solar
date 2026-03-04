//@ compile-flags: -Ztypeck
contract C {
    function value(uint256) public returns (uint) { return 1; }
    function value(uint8) public returns (uint) { return 1; }

    function f() public returns (C) { return this; }

    function g() internal returns (function(uint8) internal returns(uint))
    {
        return f().value; //~ ERROR: member `value` not unique on type `contract C`
    }
}
