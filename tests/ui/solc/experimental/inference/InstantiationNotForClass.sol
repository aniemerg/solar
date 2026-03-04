pragma experimental solidity;

type T; //~ ERROR: expected `is`, found `;`
type U;

instantiation T: U {}
