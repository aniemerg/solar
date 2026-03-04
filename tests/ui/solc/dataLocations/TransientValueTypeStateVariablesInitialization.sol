//@ compile-flags: -Ztypeck
contract D { }

contract C {
	int transient x = -99; //~ ERROR: initialization of transient storage state variables is not supported
	address transient a = address(0xABC); //~ ERROR: initialization of transient storage state variables is not supported
	bool transient b = x > 0 ? false : true; //~ ERROR: initialization of transient storage state variables is not supported
}
