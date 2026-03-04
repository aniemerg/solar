//@ compile-flags: -Ztypeck
library L {
	function f() public {
		int x = 1;
	}
}

contract C {
	event Test(function() external indexed);

	function g() public {
		Test(L.f); //~ ERROR: event invocations have to be prefixed by "emit"
//~^ ERROR: member `f` not found on type `type(library L)`
	}
}

contract D {
	event Test(function() external);

	function f() public {
		Test(L.f); //~ ERROR: event invocations have to be prefixed by "emit"
//~^ ERROR: member `f` not found on type `type(library L)`
	}
}

contract E {
	event Test(function() external indexed);

	using L for D;

	function k() public {
		Test(D.f); //~ ERROR: event invocations have to be prefixed by "emit"
//~^ ERROR: member `f` not found on type `type(contract D)`
	}
}
