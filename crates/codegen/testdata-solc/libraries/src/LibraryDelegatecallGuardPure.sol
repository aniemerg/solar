// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LDelegatePure {
    function f(uint256[] storage x) public pure returns (uint256) {
        return 23;
    }
}

contract LibraryDelegatecallGuardPure {
    uint256[] y;
    string x;

    constructor() { y.push(42); }

    function f() public view returns (uint256) {
        return LDelegatePure.f(y);
    }

    function g() public returns (bool, uint256) {
        uint256 ys;
        assembly { ys := y.slot }
        (bool success, bytes memory data) = address(LDelegatePure).delegatecall(abi.encodeWithSelector(LDelegatePure.f.selector, ys));
        return (success, success ? abi.decode(data, (uint256)) : 0);
    }

    function h() public returns (bool, uint256) {
        uint256 ys;
        assembly { ys := y.slot }
        (bool success, bytes memory data) = address(LDelegatePure).call(abi.encodeWithSelector(LDelegatePure.f.selector, ys));
        return (success, success ? abi.decode(data, (uint256)) : 0);
    }
}
