// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConditionalExpressionMultiple {
    function f(uint x) public pure returns (uint d) {
        return x > 100 ?
                    x > 1000 ? 1000 : 100
                    :
                    x > 50 ? 50 : 10;
    }
}
