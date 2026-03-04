// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {a as b, fre} from "./SameConstantsDifferentFilesHelper.sol";
import "./SameConstantsDifferentFilesHelper.sol" as M;

uint256 constant a = 13;

contract SameConstantsDifferentFiles {
    function f() public pure returns (uint, uint, uint, uint) {
        return (a, fre(), M.a, b);
    }
}
