//@ compile-flags: -Ztypeck
contract C {
    // Fool parser into parsing a constructor as a function type.
    function f() {
      constructor() x; //~ ERROR: expected one of `(`, `+`, `[`, `_`, `assembly`, `break`, `continue`, `delete`, `do`, `emit`, `for`, `if`, `new`, `payable`, `return`, `revert`, `throw`, `try`, `type`, `unchecked`, `while`, `{`, `}`, elementary type name, identifier, or literal, found keyword `constructor`
    }
}
