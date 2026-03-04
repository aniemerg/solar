pragma experimental solidity;

class Self: C {} //~ ERROR: expected one of `;` or `=`, found `:`

function f() {}

instantiation f: C {}
