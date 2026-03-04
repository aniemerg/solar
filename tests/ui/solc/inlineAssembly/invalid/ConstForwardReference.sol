//@ compile-flags: -Ztypeck
contract C {
  function f() { //~ ERROR: no visibility specified
    assembly {
      c := add(add(1, 2), c)
    }
  }
  int constant c = 0 + 1;
}
