pragma experimental solidity;

function f() {}

class Self: C //~ ERROR: expected one of `;` or `=`, found `:`
{
    function g(self: Self, x: f);
}
