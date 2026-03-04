//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        payable(this).transfer(1);
        require(payable(this).send(2)); //~ ERROR: no matching declarations found
        selfdestruct(payable(this));
        (bool success,) = address(this).delegatecall(""); //~ ERROR: mismatched types
//~^ ERROR: mismatched number of components
//~^^ ERROR: mismatched types
        require(success); //~ ERROR: no matching declarations found
		(success,) = address(this).call(""); //~ ERROR: tuple components cannot be empty
//~^ ERROR: mismatched types
        require(success); //~ ERROR: no matching declarations found
    }
    function g() pure public {
        bytes32 x = keccak256("abc"); //~ ERROR: mismatched types
        bytes32 y = sha256("abc"); //~ ERROR: mismatched types
        address z = ecrecover(bytes32(uint256(1)), uint8(2), bytes32(uint256(3)), bytes32(uint256(4)));
        require(true); //~ ERROR: no matching declarations found
        assert(true);
        x; y; z;
    }
    receive() payable external {}
}
