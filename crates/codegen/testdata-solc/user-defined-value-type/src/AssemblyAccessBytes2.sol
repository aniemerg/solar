// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type MyBytes2 is bytes2;

contract AssemblyAccessBytes2 {
    function f(MyBytes2 val) external pure returns (bytes2 ret) {
        assembly {
            ret := val
        }
    }

    function g(bytes2 val) external pure returns (bytes2 ret) {
        assembly {
            ret := val
        }
    }

    function h(uint256 val) external pure returns (MyBytes2) {
        MyBytes2 ret;
        assembly {
            ret := val
        }
        return ret;
    }
}
