//@ compile-flags: -Ztypeck
contract D {}
contract C {
    function foo(int a) pure internal {
        foo{gas: 5}; //~ ERROR: call options must be part of a call expression
    }
}
