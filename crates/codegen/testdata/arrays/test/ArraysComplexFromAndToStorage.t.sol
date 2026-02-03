// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/ArraysComplexFromAndToStorage.sol";

contract ArraysComplexFromAndToStorageTest {
    ArraysComplexFromAndToStorage c;

    function setUp() public {
        c = new ArraysComplexFromAndToStorage();
    }

    function makeInput() internal pure returns (uint24[3][] memory data) {
        data = new uint24[3][](6);
        uint24 value = 1;
        for (uint256 i = 0; i < 6; i++) {
            for (uint256 j = 0; j < 3; j++) {
                data[i][j] = value;
                value += 1;
            }
        }
    }

    function test_ArraysComplexFromAndToStorage() public {
        uint24[3][] memory input = makeInput();
        assert(c.set(input) == 6);

        assert(c.data(2, 2) == 9);
        assert(c.data(5, 1) == 17);

        bool reverted = false;
        try c.data(6, 0) returns (uint24) {
            reverted = false;
        } catch {
            reverted = true;
        }
        assert(reverted);

        uint24[3][] memory output = c.get();
        assert(output.length == 6);
        for (uint256 i = 0; i < 6; i++) {
            for (uint256 j = 0; j < 3; j++) {
                assert(output[i][j] == input[i][j]);
            }
        }
    }
}
