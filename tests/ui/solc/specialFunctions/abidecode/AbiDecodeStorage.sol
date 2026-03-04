//@ compile-flags: -Ztypeck
// This restriction might be lifted in the future
contract C {
  function f() {
    abi.decode("abc", (bytes storage)); //~ ERROR: expected one of `(`, `)`, `,`, `.`, `?`, `[`, `payable`, `pure`, `view`, or `{`, found keyword `storage`
  }
}
