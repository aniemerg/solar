// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/TryCatchPanic.sol";

contract TryCatchPanicTest {
    function test_TryCatchPanic_OnlyPanic() public {
        TryCatchPanic c = new TryCatchPanic();
        (uint256 r, uint256 code) = c.onlyPanic(true, 7, 6);
        assert(r == 1);
        assert(code == 0);

        (r, code) = c.onlyPanic(true, 6, 7);
        assert(r == 0);
        assert(code == 0x11);

        (bool ok, ) = address(c).call(
            abi.encodeWithSelector(TryCatchPanic.onlyPanic.selector, false, 7, 6)
        );
        assert(ok == false);
    }

    function test_TryCatchPanic_PanicAndError() public {
        TryCatchPanic c = new TryCatchPanic();
        (uint256 r, uint256 code, string memory msg_) = c.panicAndError(true, 7, 6);
        assert(r == 1);
        assert(code == 0);
        assert(bytes(msg_).length == 0);

        (r, code, msg_) = c.panicAndError(true, 6, 7);
        assert(r == 0);
        assert(code == 0x11);
        assert(bytes(msg_).length == 0);

        (r, code, msg_) = c.panicAndError(false, 7, 6);
        assert(r == 0);
        assert(code == 0);
        assert(keccak256(bytes(msg_)) == keccak256(bytes("failure")));
    }
}
