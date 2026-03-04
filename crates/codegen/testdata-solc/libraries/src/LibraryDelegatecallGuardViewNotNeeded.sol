// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LDelegateViewNot {
    function f(uint256[] storage x) public view returns (uint256) {
        return 84;
    }
}

contract LibraryDelegatecallGuardViewNotNeeded {
    uint256[] y;

    constructor() { y.push(42); }

    function f() public view returns (uint256) {
        return LDelegateViewNot.f(y);
    }

    function g() public returns (bool, uint256) {
        uint256 ys;
        assembly { ys := y.slot }
        (bool success, bytes memory data) = address(LDelegateViewNot).delegatecall(abi.encodeWithSelector(LDelegateViewNot.f.selector, ys));
        return (success, success ? abi.decode(data, (uint256)) : 0);
    }

    function h() public returns (bool, uint256) {
        uint256 ys;
        assembly { ys := y.slot }
        (bool success, bytes memory data) = address(LDelegateViewNot).call(abi.encodeWithSelector(LDelegateViewNot.f.selector, ys));
        return (success, success ? abi.decode(data, (uint256)) : 0);
    }
}
