// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NestedTuples {
    function f0() public pure returns(int, bool) {
        int a;
        bool b;
        ((a, b)) = (2, true);
        return (a, b);
    }
    function f1() public pure returns(int) {
        int a;
        (((a, ), )) = ((1, 2) ,3);
        return a;
    }
    function f2() public pure returns(int) {
        int a;
        (((, a),)) = ((1, 2), 3);
        return a;
    }
    function f3() public pure returns(int) {
        int a = 3;
        ((, ), ) = ((7, 8), 9);
        return a;
    }
    function f4() public pure returns(int) {
        int a;
        (a, ) = (4, (8, 16, 32));
        return a;
    }
}
