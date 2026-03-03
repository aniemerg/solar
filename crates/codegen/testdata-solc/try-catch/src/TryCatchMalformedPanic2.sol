// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TryCatchMalformedPanic2 {
    function f(uint size) public pure {
        assembly {
            mstore(0, 0x4e487b7100000000000000000000000000000000000000000000000000000000)
            mstore(4, 0x43)
            revert(0, size)
        }
    }
    function a() public returns (uint) {
        try this.f(3) {
            assert(false);
        } catch Panic(uint) {
            assert(false);
        }
        // Error will be re-thrown, since there is no low-level catch clause
        assert(false);
    }
    function b() public returns (uint) {
        try this.f(6) {
            assert(false);
        } catch Panic(uint) {
            assert(false);
        }
        // Error will be re-thrown, since there is no low-level catch clause
        assert(false);
    }
    function c() public returns (uint) {
        try this.f(0x24) {
            assert(false);
        } catch Panic(uint cv) {
            assert(true);
            return cv;
        }
        assert(false);
    }
    function d() public returns (uint) {
        try this.f(0x100) {
            assert(false);
        } catch Panic(uint cv) {
            assert(true);
            return cv;
        }
        assert(false);
    }
}
