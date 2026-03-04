pragma experimental solidity;

type T(A); //~ ERROR: expected `is`, found `(`
type U;
type V;

function f(x: T(U)) {}

function run(a: T(V)) {
    f(a);
}
