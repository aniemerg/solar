//@ compile-flags: -Ztypeck
contract C {
    function f() public view {
        assembly {
            pop(difficulty())
        }
    }
}
