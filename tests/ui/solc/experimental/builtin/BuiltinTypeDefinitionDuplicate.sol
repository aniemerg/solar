pragma experimental solidity;

type void1 = __builtin("void"); //~ ERROR: expected `is`, found `=`
type void2 = __builtin("void");

type word1 = __builtin("word");
type word2 = __builtin("word");

type fun1(T, U) = __builtin("fun");
type fun2(T, U) = __builtin("fun");
