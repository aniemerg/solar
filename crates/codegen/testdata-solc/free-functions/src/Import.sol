// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ImportHelper.sol";
import "./ImportHelper.sol" as A;

contract Import {
    A.S data;

    function f(uint v) public returns (uint one, uint two) {
        A.set(data, v);
        one = data.x;
        set(data, v + 1);
        two = data.x;
    }
}
