// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface HelloWorld {
    function hello() external pure;
    function world(int) external pure;
}

interface HelloWorldDerived is HelloWorld {
    function other() external pure;
}

interface ERC165 {
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}

contract Interfaces {
    bytes4 public ghello_world_interfaceId = type(HelloWorld).interfaceId;
    bytes4 public ERC165_interfaceId = type(ERC165).interfaceId;

    function hello() public pure returns (bytes4 data) {
        HelloWorld i;
        return i.hello.selector;
    }

    function world() public pure returns (bytes4 data) {
        HelloWorld i;
        return i.world.selector;
    }

    function hello_world() public pure returns (bytes4 data) {
        return 0xc6be8b58;
    }

    function hello_world_interfaceId() public pure returns (bytes4 data) {
        return type(HelloWorld).interfaceId;
    }

    function other() public pure returns (bytes4 data) {
        HelloWorldDerived i;
        return i.other.selector;
    }

    function hello_world_derived_interfaceId() public pure returns (bytes4 data) {
        return type(HelloWorldDerived).interfaceId;
    }
}
