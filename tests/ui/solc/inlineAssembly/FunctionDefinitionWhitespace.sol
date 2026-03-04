//@ compile-flags: -Ztypeck
contract C {
  function f() pure public {
    assembly {
      function f (a, b  , c ) -     >    y,x,z { //~ ERROR: expected one of `->` or `{`, found `-`
      }
    }
  }
}
