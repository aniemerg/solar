//@ compile-flags: -Ztypeck
contract C {
    function f() public payable {
		abi.encode(this.f{value: 2}); //~ ERROR: call options must be part of a call expression
		abi.encode(this.f{gas: 2}); //~ ERROR: call options must be part of a call expression
		abi.encode(this.f{value: 2, gas: 1}); //~ ERROR: call options must be part of a call expression
    }
}
