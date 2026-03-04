//@ compile-flags: -Ztypeck
struct this { uint a; }
struct super { uint b; }
struct _ { uint c; }

contract C {
	this a; //~ ERROR: expected item, found builtin
	super b; //~ ERROR: expected item, found builtin
	_ c;
}
