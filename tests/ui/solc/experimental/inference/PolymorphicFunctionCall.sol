pragma experimental solidity;

type T; //~ ERROR: expected `is`, found `;`
type U(A);

forall (X, Y)
function f(x, y: X, z: U(Y)) {}

function run(a: T, b: U(T), c: U(U(T))) {
    f(a, a, b);
    f(b, b, c);
}
