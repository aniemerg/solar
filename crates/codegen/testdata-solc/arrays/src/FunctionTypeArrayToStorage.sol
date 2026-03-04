// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionTypeArrayToStorage {
    string log;
    function() external[] fs;
    function() external[] gs;

    function a() external {
        log = string.concat(log, "[a called]");
    }
    function b() external {
        log = string.concat(log, "[b called]");
    }

    function f(function() external[] calldata x) external {
        fs = x;
    }
    function g(function() external[] memory x) public {
        fs = x;
    }
    function runTest() external returns (string memory) {
        log = "";
        function() external[] memory x = new function() external[](2);
        x[0] = this.a;
        x[1] = this.b;
        this.f(x);
        fs[0]();
        fs[1]();
        return log;
    }
    function runTest2() external returns (string memory) {
        log = "";
        function() external[] memory x = new function() external[](2);
        x[0] = this.b;
        x[1] = this.a;
        g(x);
        fs[0]();
        fs[1]();
        return log;
    }
    function runTest3() external returns (string memory) {
        log = "";
        gs = fs;
        gs[0]();
        gs[1]();
        return log;
    }
}
