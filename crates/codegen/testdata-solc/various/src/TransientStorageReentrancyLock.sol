// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransientStorageReentrancyLock {
    bool transient locked;

    modifier nonReentrant() {
        require(!locked, "Reentrancy attempt");
        locked = true;
        _;
        locked = false;
    }

    function tryCall(address newAddress, bool reentrancy) public nonReentrant {
        if (reentrancy) reentrantCall(newAddress);
    }

    function reentrantCall(address a) public {
        this.tryCall(a, false);
    }
}
