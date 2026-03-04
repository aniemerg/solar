//@ compile-flags: -Ztypeck
contract A { }
contract B is A {
    function f() public { A a = B(address(1)); } //~ ERROR: invalid explicit type conversion
}
