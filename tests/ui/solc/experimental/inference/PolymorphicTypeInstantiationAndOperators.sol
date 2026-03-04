pragma experimental solidity;

type bool = __builtin("bool"); //~ ERROR: expected identifier, found keyword `bool`
//~^ ERROR: expected `is`, found `=`

type T(A);
type int;
type str;

class Self: C {
    function foo(a: Self, b: Self) -> Self;
}

class Self: P1 {}
class Self: P2 {}
class Self: P3 {}
class Self: P4 {}

instantiation int: P1 {}
instantiation int: P2 {}
instantiation int: P3 {}

instantiation str: P1 {}
instantiation str: P2 {}
instantiation str: P4 {}

instantiation T(A: P1): + {
    function add(x: T(A), y: T(A)) -> T(A) {}
}

instantiation T(A: P2): == {
    function eq(x: T(A), y: T(A)) -> bool {}
}

instantiation T(A: (P1, P2)): C {
    function foo(x: T(A), y: T(A)) -> T(A) {}
}

function fun(a: T(int: P3), b: T(str: P4)) {
    a + a;
    b + b;

    a == a;
    b == b;

    C.foo(a, a);
    C.foo(b, b);
}
