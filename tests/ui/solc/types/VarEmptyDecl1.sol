//@ compile-flags: -Ztypeck
contract C {
    function f() public pure {
        var a; //~ ERROR: expected one of `(`, `+`, `[`, `_`, `assembly`, `break`, `continue`, `delete`, `do`, `emit`, `for`, `if`, `new`, `payable`, `return`, `revert`, `throw`, `try`, `type`, `unchecked`, `while`, `{`, `}`, elementary type name, identifier, or literal, found reserved keyword `var`
        a.NeverReachedByParser();
    }
}
