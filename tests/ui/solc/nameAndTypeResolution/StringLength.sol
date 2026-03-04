//@ compile-flags: -Ztypeck
contract C {
    string s;
    function f() public { uint a = s.length; } //~ ERROR: member `length` not found on type `string storage`
}
