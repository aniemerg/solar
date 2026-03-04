//@ compile-flags: -Ztypeck
pragma abicoder v1;
contract C {
	struct s { uint a; uint b; }
    function f() pure public {
        abi.decode("", (s)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 0
    }
}
