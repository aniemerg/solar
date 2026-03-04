pragma experimental solidity;

type uint; //~ ERROR: expected identifier, found keyword `uint`
//~^ ERROR: expected `is`, found `;`
type string;

type T(A);
type U(B) = T(B);

function fun() {
    let w: U(uint);
    let v: T(uint);
    U.rep(w);
    U.abs(v);

    let s: U(string);
    let t: T(string);
    U.rep(s);
    U.abs(t);
}
