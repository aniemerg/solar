contract C {
    uint x = unchecked { f() + 2 } //~ ERROR: expected one of `(`, `+`, `[`, `delete`, `new`, `payable`, `type`, elementary type name, identifier, or literal, found keyword `unchecked`
    function f() public pure returns (uint) {
        return 4;
    }
}
