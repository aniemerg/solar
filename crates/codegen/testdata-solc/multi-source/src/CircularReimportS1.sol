// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {f as g, g as h} from "./CircularReimportS2.sol";
function f() pure returns (uint) { return 100 + h() - g(); }
