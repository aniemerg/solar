pragma experimental solidity;

type void = __builtin("void"); //~ ERROR: expected `is`, found `=`

type bool = __builtin("bool");
type word = __builtin("word");
type integer = __builtin("integer");
type unit = __builtin("unit");

type fun(T, U) = __builtin("fun");
type pair(T, U) = __builtin("pair");

contract C {
    fallback() external {
        let v: void;

        let b: bool;
        bool.abs(bool.rep(b));

        let w: word;
        let i: integer;
        let u: unit;

        let f: fun(word, bool);
        b = f(w);

        let p: pair(bool, word);
        pair.first(p);
        pair.second(p);
    }
}
