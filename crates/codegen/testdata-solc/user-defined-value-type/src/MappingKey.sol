// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type MyInt is int;

contract MappingKey {
    mapping(MyInt => int) public m;

    function set(MyInt key, int value) external {
        m[key] = value;
    }
    function set_unwrapped(int key, int value) external {
        m[MyInt.wrap(key)] = value;
    }
}
