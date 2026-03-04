//@ compile-flags: -Ztypeck
library D { function f(bytes calldata) internal pure {} }
contract C {
	using D for bytes;
	function f(bytes memory _x) public pure {
		_x.f(); //~ ERROR: member `f` not found on type `bytes memory`
	}
}
