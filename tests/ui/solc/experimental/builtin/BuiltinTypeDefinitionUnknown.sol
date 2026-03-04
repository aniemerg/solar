pragma experimental solidity;

type someUnknownType = __builtin("someUnknownType"); //~ ERROR: expected `is`, found `=`
