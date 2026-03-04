pragma experimental solidity;

type T(P, Q, R); //~ ERROR: expected `is`, found `(`
type U;
type V;

class Self: C {}
class Self: D {}

forall (X, Y, Z)
function run() {
    let x: T(U, X, Z: C);
    let y: T(V, Y, Z: D);
}
