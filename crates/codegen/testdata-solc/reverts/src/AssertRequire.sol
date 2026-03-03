// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssertRequire {
    function f() public pure {
        assert(false);
    }

    function g(bool val) public pure returns (bool) {
        assert(val == true);
        return true;
    }

    function h(bool val) public pure returns (bool) {
        require(val);
        return true;
    }
}
