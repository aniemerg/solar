//@ compile-flags: -Ztypeck
contract D {}
contract C {
    function foo() pure internal {
		new D{salt:"abc", value:3, gas: 4}; //~ ERROR: call options must be part of a call expression
		new D{slt:5, value:3}; //~ ERROR: call options must be part of a call expression
		new D{val:5}; //~ ERROR: call options must be part of a call expression
		new D{salt:"xyz", salt:"aaf"}; //~ ERROR: call options must be part of a call expression
		new D{value:3, value:4}; //~ ERROR: call options must be part of a call expression
		new D{random:5+5}; //~ ERROR: call options must be part of a call expression
		new D{what:2130+5}; //~ ERROR: call options must be part of a call expression
		new D{gas: 2}; //~ ERROR: call options must be part of a call expression
    }
}
