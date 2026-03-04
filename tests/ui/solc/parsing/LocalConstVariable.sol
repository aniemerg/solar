contract Foo {
	function localConst() returns (uint ret) //~ ERROR: no visibility specified
	{
		uint constant local = 4; //~ ERROR: mutability is not allowed here
		return local;
	}
}
