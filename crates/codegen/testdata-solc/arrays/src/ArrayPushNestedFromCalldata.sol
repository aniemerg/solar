// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayPushNestedFromCalldata {
    uint8 b = 23;
    uint120[][] s;
    uint8 a = 17;

    function f(uint120[] calldata c) public returns (uint120) {
        s.push(c);
        assert(s.length == 1);
        assert(s[0].length == c.length);
        assert(s[0].length > 0);
        return s[0][0];
    }
}
