// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library L {
    function run(
        function(uint256) external returns (uint256) _operation,
        uint256 _a
    )
        external
        returns (uint256)
    {
        return _operation(_a);
    }
}

contract ExternalCallWithFunctionPointerParameter {
    function double(uint256 _a) external returns (uint256) {
        return _a * _a;
    }

    function g(uint256 _value) external returns (uint256) {
        return L.run(this.double, _value);
    }
}
