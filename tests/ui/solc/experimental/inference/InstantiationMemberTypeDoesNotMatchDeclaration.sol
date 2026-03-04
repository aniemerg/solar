pragma experimental solidity;

type T; //~ ERROR: expected `is`, found `;`
type U;

class Self: C {
    function f(self: Self);
}

instantiation T: C {
    function f(self: U) {}
}
