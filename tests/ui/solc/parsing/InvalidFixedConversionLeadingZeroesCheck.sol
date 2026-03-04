contract test {
	function f() {
		fixed a = 1.0x2; //~ ERROR: expected one of `(`, `.`, `;`, `?`, `[`, or `{`, found `x2`
	}
}
