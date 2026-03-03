// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
pragma abicoder v2;

struct S {
    uint256 a;
    bool b;
    string s;
}

error E();
error E1(uint256);
error E2(string);
error E3(S);
error E4(address);
error E5(function() external pure);

contract ErrorsByParameterType {
    function a() external pure {
        require(false, E());
    }

    function b() external pure {
        require(false, E1(1));
    }

    function c() external pure {
        require(false, E2("string literal"));
    }

    function d() external pure {
        require(false, E3(S(1, true, "string literal")));
    }

    function e() external view {
        require(false, E4(address(0x1234)));
    }

    function f() external view {
        require(false, E5(ErrorsByParameterType(address(0x1234)).a));
    }
}
