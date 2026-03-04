contract C {
	modifier this { _; } //~ ERROR: identifier `this` already declared
	modifier super { _; } //~ ERROR: identifier `super` already declared
	modifier _ { _; }
}
