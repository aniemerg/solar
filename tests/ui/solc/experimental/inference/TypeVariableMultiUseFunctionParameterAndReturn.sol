pragma experimental solidity;

type T; //~ ERROR: expected `is`, found `;`
type U;

forall X
function f(x: X) -> X {}

function test(t: T, u: U) {
    t = f(u);
}
