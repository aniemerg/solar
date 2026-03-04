// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LStorageArray {
    function f(uint256[2] storage _a) external returns (uint256) {
        return _a[0] * _a[1];
    }
}

contract ExternalCallWithStorageArrayParameter {
    uint256[2] x;

    function g(uint256 _value) external returns (uint256) {
        x[0] = x[1] = _value;
        return LStorageArray.f(x);
    }
}
