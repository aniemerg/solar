//@ compile-flags: -Ztypeck
contract test {
    function f() public {
      uint storage a1; //~ ERROR: data location can only be specified for array, struct or mapping types
      bytes16 storage b1; //~ ERROR: data location can only be specified for array, struct or mapping types
      uint memory a2; //~ ERROR: data location can only be specified for array, struct or mapping types
      bytes16 memory b2; //~ ERROR: data location can only be specified for array, struct or mapping types
    }
}
