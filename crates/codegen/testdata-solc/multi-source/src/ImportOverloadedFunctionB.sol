// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {sub} from "./ImportOverloadedFunctionA.sol";
contract C
{
    function f() public pure returns (uint, uint) {
        return (sub(1, 2), sub(2));
    }
}
