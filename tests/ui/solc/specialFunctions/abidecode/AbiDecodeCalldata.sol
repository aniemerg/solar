//@ compile-flags: -Ztypeck
// This restriction might be lifted in the future
contract C {
  function f() public pure {
    abi.decode("abc", (bytes calldata)); //~ ERROR: expected one of `(`, `)`, `,`, `.`, `?`, `[`, `payable`, `pure`, `view`, or `{`, found keyword `calldata`
  }
}
