// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StaticallForViewAndPureC {
    uint256 x;

    function f() public returns (uint256) {
        x = 3;
        return 1;
    }
}

interface StaticallForViewAndPureCView {
    function f() external view returns (uint256);
}

interface StaticallForViewAndPureCPure {
    function f() external pure returns (uint256);
}

contract StaticallForViewAndPure {
    function f() public returns (uint256) {
        return (new StaticallForViewAndPureC()).f();
    }

    function fview() public returns (uint256) {
        return (StaticallForViewAndPureCView(address(new StaticallForViewAndPureC()))).f();
    }

    function fpure() public returns (uint256) {
        return (StaticallForViewAndPureCPure(address(new StaticallForViewAndPureC()))).f();
    }
}
