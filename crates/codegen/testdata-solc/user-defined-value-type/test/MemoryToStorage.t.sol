// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MemoryToStorage.sol";

contract MemoryToStorageTest {
    function test_structMemory() public {
        MemoryToStorage c = new MemoryToStorage();
        (uint8 a0, Small b0, Left cc0, uint8 d0) = c.s();
        assert(a0 == 0 && Small.unwrap(b0) == 0 && d0 == 0);

        c.f(S({a: 1, b: Small.wrap(0xff), c: Left.wrap("ab"), d: 15}));
        (uint8 a1, Small b1, Left cc1, uint8 d1) = c.s();
        assert(a1 == 1);
        assert(Small.unwrap(b1) == 0xff);
        assert(Left.unwrap(cc1) == "ab");
        assert(d1 == 15);
    }

    function test_smallArray() public {
        MemoryToStorage c = new MemoryToStorage();
        Small[] memory arr = new Small[](3);
        arr[0] = Small.wrap(1);
        arr[1] = Small.wrap(2);
        arr[2] = Small.wrap(3);
        Small[] memory result = c.g(arr);
        assert(result.length == 3);
        assert(Small.unwrap(result[0]) == 1);
        assert(Small.unwrap(result[1]) == 2);
        assert(Small.unwrap(c.small(0)) == 1);
        assert(Small.unwrap(c.small(1)) == 2);
    }

    function test_leftArray() public {
        MemoryToStorage c = new MemoryToStorage();
        Left[] memory arr = new Left[](3);
        arr[0] = Left.wrap("ab");
        arr[1] = Left.wrap("cd");
        arr[2] = Left.wrap("ef");
        Left[] memory result = c.h(arr);
        assert(result.length == 3);
        assert(Left.unwrap(result[0]) == "ab");
        assert(Left.unwrap(result[1]) == "cd");
        assert(Left.unwrap(c.l(0)) == "ab");
        assert(Left.unwrap(c.l(1)) == "cd");
    }
}
