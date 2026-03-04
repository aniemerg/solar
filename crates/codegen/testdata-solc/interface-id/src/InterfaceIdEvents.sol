// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface HelloWorld {
    function hello() external pure;
    function world(int) external pure;
}

interface HelloWorldWithEvent {
    event Event();
    function hello() external pure;
    function world(int) external pure;
}

contract InterfaceIdEvents {
    bytes4 public hello_world = type(HelloWorld).interfaceId;
    bytes4 public hello_world_with_event = type(HelloWorldWithEvent).interfaceId;
}
