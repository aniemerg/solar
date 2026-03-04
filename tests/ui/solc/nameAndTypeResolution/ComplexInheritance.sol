//@ compile-flags: -Ztypeck
contract A { function f() public virtual { uint8 x = C(address(0)).g(); } } //~ ERROR: invalid explicit type conversion
contract B { function f() public virtual {} function g() public returns (uint8) {} }
contract C is A, B { function f() public override (A, B) { A.f(); } } //~ ERROR: member `f` not found on type `type(contract A)`
