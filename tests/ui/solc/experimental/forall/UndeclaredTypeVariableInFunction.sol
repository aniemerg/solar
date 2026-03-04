pragma experimental solidity;

type T(X); //~ ERROR: expected `is`, found `(`

function f(p: P, q: T(Q)) {
    let r: (R, S);
    let s: S;
}
