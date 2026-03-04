//@ compile-flags: -Ztypeck
contract C {
    function f() public returns (C) { return this; }
    function g() public returns (uint) { return f().balance; } //~ ERROR: member `balance` not found on type `contract C`
}
