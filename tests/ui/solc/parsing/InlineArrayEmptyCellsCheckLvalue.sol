contract c {
	uint[] a;
	function f() returns (uint) {
		a = [,2,3]; //~ ERROR: array expression components cannot be empty
		return (a[0]);
	}
}
