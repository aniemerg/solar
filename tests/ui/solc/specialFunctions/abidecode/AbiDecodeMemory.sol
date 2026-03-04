//@ compile-flags: -Ztypeck
contract C {
  function f() public pure {
    abi.decode("abc", (bytes memory, uint[][2] memory)); //~ ERROR: expected one of `(`, `)`, `,`, `.`, `?`, `[`, `payable`, `pure`, `view`, or `{`, found keyword `memory`
  }
}
