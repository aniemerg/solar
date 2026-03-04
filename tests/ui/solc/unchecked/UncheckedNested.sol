contract C {
    function f() public pure {
        unchecked {
            unchecked { //~ ERROR: `unchecked` blocks cannot be nested
                uint x = 2 + 3;
            }
        }
    }
}
