//@ compile-flags: -Ztypeck
contract C
{
	function foo() virtual public virtual {} //~ ERROR: virtual already specified
	modifier modi() virtual virtual {_;} //~ ERROR: virtual already specified
}
