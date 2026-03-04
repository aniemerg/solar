pragma experimental solidity;

type T; //~ ERROR: expected `is`, found `;`
type U;

forall X
function f(x: X, y: X) {}

function test(t: T, u: U) {
    f(t, u);
}
