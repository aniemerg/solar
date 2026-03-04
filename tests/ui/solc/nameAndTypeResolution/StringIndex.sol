//@ compile-flags: -Ztypeck
contract C {
    string s;
    function f() public { bytes1 a = s[2]; } //~ ERROR: cannot index into string storage
}
