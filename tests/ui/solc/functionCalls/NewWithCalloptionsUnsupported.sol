//@ compile-flags: -Ztypeck
contract D { constructor() payable {} }
contract C {
    function foo() pure internal {
		new D{salt:"abc", value:3}; //~ ERROR: call options must be part of a call expression
		new D{salt:"abc"}; //~ ERROR: call options must be part of a call expression
		new D{value:5+5}; //~ ERROR: call options must be part of a call expression
		new D{salt:"aabbcc"}; //~ ERROR: call options must be part of a call expression
    }
}
