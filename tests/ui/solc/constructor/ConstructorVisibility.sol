//@ compile-flags: -Ztypeck
// The constructor of a base class should not be visible in the derived class
contract A { constructor(string memory) { } }
contract B is A { //~ ERROR: wrong number of arguments for base constructor: expected 1, found 0
  function f() pure public {
    A x = A(address(0)); // convert from address
//~^ ERROR: invalid explicit type conversion
    string memory y = "ab"; //~ ERROR: mismatched types
    A(y); // call as a function is invalid
//~^ ERROR: invalid explicit type conversion
    x;
  }
}
