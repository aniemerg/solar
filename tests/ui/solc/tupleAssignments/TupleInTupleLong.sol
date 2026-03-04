//@ compile-flags: -Ztypeck
contract C {
  function f() public {
    (((((((((((,2),)),)),),))=4))); //~ ERROR: tuple components cannot be empty
//~^ ERROR: expression has to be an lvalue
//~^^ ERROR: tuple components cannot be empty
//~^^^ ERROR: tuple components cannot be empty
//~^^^^ ERROR: tuple components cannot be empty
//~^^^^^ ERROR: tuple components cannot be empty
  }
}
