// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayPushNested {
    uint8 b = 23;
    uint120[][] s;
    uint8 a = 17;

    function f() public {
        s.push();
        assert(s.length == 1);
        assert(s[0].length == 0);
        s[0].push();
        assert(s[0].length == 1);
        assert(s[0][0] == 0);
    }
}
