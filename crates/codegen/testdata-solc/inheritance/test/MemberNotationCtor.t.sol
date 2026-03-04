// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MemberNotationCtor.sol";

contract MemberNotationCtorTest {
    MemberNotationCtorA a;

    function setUp() public {
        a = new MemberNotationCtorA();
    }

    function test_MemberNotationCtor() public {
        assert(a.g(-1) == -1);
        assert(a.g(10) == 10);
    }
}
