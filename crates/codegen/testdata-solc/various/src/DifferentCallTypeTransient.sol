// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DifferentCallTypeTransientB {
    uint256 transient public value;

    function setValue(uint256 v) public {
        value += v;
    }
}

contract DifferentCallTypeTransientA {
    uint256 transient public value;

    function delegateSetValue(address otherContract, uint256 v) public {
        (bool success,) =
            otherContract.delegatecall(abi.encodeWithSignature("setValue(uint256)", v));
        require(success);
    }

    function callSetValue(address otherContract, uint256 v) public {
        (bool success,) =
            otherContract.call(abi.encodeWithSignature("setValue(uint256)", v));
        require(success);
    }

    function staticSetValue(address otherContract, uint256 v) public view returns (bool) {
        (bool success,) =
            otherContract.staticcall(abi.encodeWithSignature("setValue(uint256)", v));
        return success;
    }
}

contract DifferentCallTypeTransient {
    DifferentCallTypeTransientA a = new DifferentCallTypeTransientA();
    DifferentCallTypeTransientB b = new DifferentCallTypeTransientB();

    function testDelegate() public returns (uint256, uint256) {
        a.delegateSetValue(address(b), 7);
        return (a.value(), b.value());
    }

    function testCall() public returns (uint256, uint256) {
        a.callSetValue(address(b), 8);
        return (a.value(), b.value());
    }

    function testStatic() public view returns (bool) {
        return a.staticSetValue(address(b), 0);
    }
}
