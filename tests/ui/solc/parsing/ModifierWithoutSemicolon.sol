contract c {
	modifier mod { if (msg.sender == 0) _ } //~ ERROR: expected one of `(`, `.`, `;`, `?`, `[`, or `{`, found `}`
}
