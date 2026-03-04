// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type MyAddress is address;

contract Parameter {
    function id(MyAddress a) external pure returns (MyAddress b) {
        b = a;
    }

    function unwrap_assembly(MyAddress a) external pure returns (address b) {
        assembly { b := a }
    }

    function wrap_assembly(address a) external pure returns (MyAddress b) {
        assembly { b := a }
    }

    function unwrap(MyAddress a) external pure returns (address b) {
        b = MyAddress.unwrap(a);
    }

    function wrap(address a) external pure returns (MyAddress b) {
        b = MyAddress.wrap(a);
    }
}
