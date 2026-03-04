// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CallingUninitializedFunction {
    function intern() public returns (uint256) {
        function (uint) internal returns (uint) x;
        x(2);
        return 7;
    }

    function extern_func() public returns (uint256) {
        function (uint) external returns (uint) x;
        x(2);
        return 7;
    }
}
