pragma experimental solidity;

type T; //~ ERROR: expected `is`, found `;`
type U;

function f(x) {}

function run(a: T, b: U) {
    // NOTE: The type of f is polymorphic but the inferred type of g is not - this would be
    // let-polymorphism, which we decided not to support.
    let g = f;
    g(a);
    g(b);
}
