// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/StaticArrayCopyCleanup.sol";

contract StaticArrayCopyCleanupTest {
    StaticArrayCopyCleanup c;

    function setUp() public {
        c = new StaticArrayCopyCleanup();
    }

    function assertArrayEq20(uint64[20] memory a, uint64[20] memory b) internal pure {
        for (uint256 i = 0; i < 20; i++) {
            assert(a[i] == b[i]);
        }
    }

    function assertArrayEq40(uint64[40] memory a, uint64[40] memory b) internal pure {
        for (uint256 i = 0; i < 40; i++) {
            assert(a[i] == b[i]);
        }
    }

    function expectedSource() internal pure returns (uint64[20] memory result) {
        for (uint256 i = 0; i < 5; i++) {
            result[i * 4] = uint64(1 + i * 4);
            result[i * 4 + 1] = uint64(2 + i * 4);
            result[i * 4 + 2] = uint64(3 + i * 4);
            result[i * 4 + 3] = uint64(4 + i * 4);
        }
    }

    function expectedDest() internal pure returns (uint64[40] memory result) {
        for (uint256 i = 0; i < 10; i++) {
            result[i * 4] = uint64(100 + i * 4);
            result[i * 4 + 1] = uint64(101 + i * 4);
            result[i * 4 + 2] = uint64(102 + i * 4);
            result[i * 4 + 3] = uint64(103 + i * 4);
        }
    }

    function expectedDestAfterCopy() internal pure returns (uint64[40] memory result) {
        for (uint256 i = 0; i < 5; i++) {
            result[i * 4] = uint64(1 + i * 4);
            result[i * 4 + 1] = uint64(2 + i * 4);
            result[i * 4 + 2] = uint64(3 + i * 4);
            result[i * 4 + 3] = uint64(4 + i * 4);
        }
    }

    function zeros20() internal pure returns (uint64[20] memory result) {}

    function zeros40() internal pure returns (uint64[40] memory result) {}

    function test_StaticArrayCopyCleanup() public {
        assert(c.canary() == type(uint256).max);

        assertArrayEq20(c.getSourceAsUint(), zeros20());
        assertArrayEq40(c.getDestAsUint(), zeros40());

        c.fillSource();
        assert(c.canary() == type(uint256).max);
        assertArrayEq20(c.getSourceAsUint(), expectedSource());

        c.fillDest();
        assert(c.canary() == type(uint256).max);
        assertArrayEq20(c.getSourceAsUint(), expectedSource());
        assertArrayEq40(c.getDestAsUint(), expectedDest());

        c.copySourceToDest();
        assert(c.canary() == type(uint256).max);
        assertArrayEq20(c.getSourceAsUint(), expectedSource());
        assertArrayEq40(c.getDestAsUint(), expectedDestAfterCopy());

        c.deleteSource();
        assert(c.canary() == type(uint256).max);
        assertArrayEq20(c.getSourceAsUint(), zeros20());
        assertArrayEq40(c.getDestAsUint(), expectedDestAfterCopy());

        c.deleteDest();
        assert(c.canary() == type(uint256).max);
        assertArrayEq20(c.getSourceAsUint(), zeros20());
        assertArrayEq40(c.getDestAsUint(), zeros40());
    }
}
