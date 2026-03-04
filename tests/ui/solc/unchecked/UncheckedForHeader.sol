contract C {
    function f() public pure {
        for (unchecked { uint x = 2 }; x < 2; x ++) { //~ ERROR: expected one of `(`, `+`, `;`, `[`, `delete`, `new`, `payable`, `type`, elementary type name, identifier, or literal, found keyword `unchecked`

        }
    }
}
