//@ compile-flags: -Ztypeck
contract D {}
contract C {
    function foo(int a) pure internal {
		  a{val:5}; //~ ERROR: call options must be part of a call expression
    }
}
