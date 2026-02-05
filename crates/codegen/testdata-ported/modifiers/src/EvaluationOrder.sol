// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EvalOrderA { constructor(uint256) {} }
contract EvalOrderB { constructor(uint256) {} }
contract EvalOrderC { constructor(uint256) {} }

contract EvaluationOrder is EvalOrderA, EvalOrderB, EvalOrderC {
    uint256[] x;

    constructor()
        EvalOrderA(f(6))
        EvalOrderB(f(2))
        EvalOrderC(f(4))
        m2(f(1))
        m1(f(3))
        m3(f(5))
    {
        f(7);
    }

    function query() public view returns (uint256[] memory) { return x; }

    modifier m1(uint256) { _; }
    modifier m2(uint256) { _; }
    modifier m3(uint256) { _; }

    function f(uint256 y) internal returns (uint256) { x.push(y); return 0; }
}
