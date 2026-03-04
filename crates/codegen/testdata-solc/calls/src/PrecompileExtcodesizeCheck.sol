// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Identity {
    function selectorAndAppendValue(uint value) external pure returns (uint);
}

interface ReturnMoreData {
    function f(uint value) external pure returns (uint, uint, uint);
}

contract PrecompileExtcodesizeCheck {
    Identity constant i = Identity(address(0x0004));

    function checkHighLevel() external pure returns (bool) {
        // Works because the extcodesize check is skipped
        // and the precompiled contract returns actual data.
        i.selectorAndAppendValue(5);
        return true;
    }

    function checkHighLevel2() external pure returns (uint, uint, uint) {
        // Fails because the identity contract does not return enough data.
        return ReturnMoreData(address(4)).f(2);
    }

    function checkLowLevel() external view returns (uint value) {
        (bool success, bytes memory ret) =
            address(4).staticcall(
                abi.encodeWithSelector(Identity.selectorAndAppendValue.selector, uint(5))
            );
        assert(success);
        value = abi.decode(ret, (uint));
    }
}
