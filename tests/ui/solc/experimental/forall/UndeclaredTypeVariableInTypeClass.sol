pragma experimental solidity;

type T(X); //~ ERROR: expected `is`, found `(`

class Self: C {
    function f(self: Self);
}

instantiation T(Y): C {
    function f(self: T(Z)) {}
}
