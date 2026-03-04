contract C {
	uint constant y = 8 gwei ether; //~ ERROR: expected one of `(`, `.`, `;`, `?`, `[`, or `{`, found keyword `ether`
}
