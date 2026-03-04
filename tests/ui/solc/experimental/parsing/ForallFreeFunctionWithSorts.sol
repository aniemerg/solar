pragma experimental solidity;

class Self: Class1 {} //~ ERROR: expected one of `;` or `=`, found `:`
class Self: Class2 {}

forall (A: (Class1, Class2), B: Class1)
function f(a: A: Class1, b: B: Class1) {}

forall A: Class1
function g(a: A) {}
