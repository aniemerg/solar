// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CallFunctionReturningNothingViaPointer {
    bool public flag = false;

    function f0() public {
        flag = true;
    }

    function f() public returns (bool) {
        function() internal x = f0;
        x();
        return flag;
    }
}
