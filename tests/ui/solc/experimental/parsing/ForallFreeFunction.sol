pragma experimental solidity;

forall (A) //~ ERROR: expected identifier, found `(`
function f(a: A) {}

forall (A, B)
function g(a: A, b: B) {}
