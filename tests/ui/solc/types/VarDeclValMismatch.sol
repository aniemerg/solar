//@ compile-flags: -Ztypeck
contract n
{
	fallback() external
	{
		// Used to cause a segfault
		(uint x, ) = (1); //~ ERROR: mismatched number of components
		(uint z) = (); //~ ERROR: mismatched number of components

		assembly {
			mstore(x, z)
		}
	}
}
