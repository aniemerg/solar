//@ compile-flags: -Ztypeck
contract C {
	function testFunction() internal {}

	function testYul() public returns (uint32) {
		function() internal fp = testFunction;
		uint selectorValue = 0;

		assembly {
			selectorValue := fp.selector
		}

		return uint32(bytes4(bytes32(selectorValue))); //~ ERROR: invalid explicit type conversion
	}
	function testSol() public returns (uint32) {
		return uint32(testFunction.selector); //~ ERROR: member `selector` not found on type `function ()`
	}
}
