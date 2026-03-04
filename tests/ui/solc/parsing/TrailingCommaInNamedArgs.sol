contract test {
	function a(uint a, uint b, uint c) returns (uint r) { r = a * 100 + b * 10 + c * 1; } //~ ERROR: no visibility specified
	function b() returns (uint r) { r = a({a: 1, b: 2, c: 3, }); } //~ ERROR: trailing `,` separator is not allowed
//~^ ERROR: no visibility specified
}
