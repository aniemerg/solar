contract A {modifier m virtual;}

abstract contract B {modifier m virtual;}
contract C is B { }

abstract contract D {modifier m;} //~ ERROR: functions without implementation must be marked virtual
