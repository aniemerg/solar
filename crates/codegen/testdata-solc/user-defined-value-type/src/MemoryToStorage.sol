// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type Small is uint16;
type Left is bytes2;
struct S { uint8 a; Small b; Left c; uint8 d; }

contract MemoryToStorage {
    S public s;
    Small[] public small;
    Left[] public l;

    function f(S memory _s) public {
        s = _s;
    }
    function g(Small[] memory _small) public returns (Small[] memory) {
        small = _small;
        return small;
    }
    function h(Left[] memory _left) public returns (Left[] memory) {
        l = _left;
        return l;
    }
}
