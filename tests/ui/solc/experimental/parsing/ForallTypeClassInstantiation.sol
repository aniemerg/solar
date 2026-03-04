pragma experimental solidity;

type T; //~ ERROR: expected `is`, found `;`

class Self: C {}

forall (A, B)
instantiation T: C {}
