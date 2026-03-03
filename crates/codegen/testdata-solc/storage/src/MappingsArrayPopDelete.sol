// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingsArrayPopDelete {
    mapping(uint => uint)[] a;

    function n1(uint key, uint value) public {
        a.push();
        a[a.length - 1][key] = value;
    }

    function n2() public {
        a.push();
    }

    function map(uint key) public view returns (uint) {
        return a[a.length - 1][key];
    }

    function p() public {
        a.pop();
    }

    function d() public returns (uint) {
        delete a;
        return a.length;
    }
}
