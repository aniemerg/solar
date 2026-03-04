// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {f as g, g as h} from "./CircularImport2S2.sol";
function f() pure returns (uint) { return 1000 + g() - h(); }
