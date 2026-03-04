contract C {
	function f() {
		uint a = (2 2); //~ ERROR: expected one of `(`, `)`, `,`, `.`, `?`, `[`, or `{`, found `<integer>`
	}
}
