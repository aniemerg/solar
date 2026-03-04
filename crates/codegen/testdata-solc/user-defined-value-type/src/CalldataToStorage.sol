// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type Small is uint16;
type Left is bytes2;
struct S { uint8 a; Small b; Left c; uint8 d; }

contract CalldataToStorage {
    S public s;
    Small[] public small;
    Left[] public l;

    function f(S calldata _s) external {
        s = _s;
    }
    function g(Small[] calldata _small) external returns (Small[] memory) {
        small = _small;
        return small;
    }
    function h(Left[] calldata _left) external returns (Left[] memory) {
        l = _left;
        return l;
    }
}
