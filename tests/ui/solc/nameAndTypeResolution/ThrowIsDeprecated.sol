//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        throw; //~ ERROR: `throw` statements have been removed; use `revert`, `require`, or `assert` instead
    }
}
