//@ compile-flags: -Ztypeck
contract C {
  string public constant name = type(C).name;
}
