pragma experimental solidity;

type T; //~ ERROR: expected `is`, found `;`
type U;

function f(x: T, y: U) {}

function run(a: U, b: T) {
    f(a, b);
}
