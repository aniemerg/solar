//@ compile-flags: -Ztypeck
contract C {
	function testFunction() internal {}

	function testYul() public returns (address adr) {
		function() internal fp = testFunction;
		uint selectorValue = 0;

		assembly {
			adr := fp.address
		}
	}
	function testSol() public returns (address) {
		return testFunction.address; //~ ERROR: member `address` not found on type `function ()`
	}
}
