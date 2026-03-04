// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LDelegateView {
    function f(uint256[] storage x) public view returns (uint256) {
        return x.length;
    }
}

contract LibraryDelegatecallGuardViewNeeded {
    uint256[] y;
    string x;

    constructor() { y.push(42); }

    function f() public view returns (uint256) {
        return LDelegateView.f(y);
    }

    function g() public returns (bool, uint256) {
        uint256 ys;
        assembly { ys := y.slot }
        (bool success, bytes memory data) = address(LDelegateView).delegatecall(abi.encodeWithSelector(LDelegateView.f.selector, ys));
        return (success, success ? abi.decode(data, (uint256)) : 0);
    }

    function h() public returns (bool, uint256) {
        uint256 ys;
        assembly { ys := y.slot }
        (bool success, bytes memory data) = address(LDelegateView).call(abi.encodeWithSelector(LDelegateView.f.selector, ys));
        return (success, success ? abi.decode(data, (uint256)) : 0);
    }
}
