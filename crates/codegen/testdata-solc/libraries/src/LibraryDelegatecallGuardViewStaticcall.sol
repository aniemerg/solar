// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DStorage {
    uint256 public x;
    constructor() { x = 42; }
}

library LDelegateStatic {
    function f(DStorage d) public view returns (uint256) {
        return d.x();
    }
}

contract LibraryDelegatecallGuardViewStaticcall {
    DStorage d;

    constructor() { d = new DStorage(); }

    function f() public view returns (uint256) {
        return LDelegateStatic.f(d);
    }

    function g() public returns (bool, uint256) {
        (bool success, bytes memory data) = address(LDelegateStatic).delegatecall(abi.encodeWithSelector(LDelegateStatic.f.selector, d));
        return (success, success ? abi.decode(data, (uint256)) : 0);
    }

    function h() public returns (bool, uint256) {
        (bool success, bytes memory data) = address(LDelegateStatic).call(abi.encodeWithSelector(LDelegateStatic.f.selector, d));
        return (success, success ? abi.decode(data, (uint256)) : 0);
    }
}
