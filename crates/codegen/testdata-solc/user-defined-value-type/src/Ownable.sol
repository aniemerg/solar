// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable {
    type Owner is address;
    Owner public owner = Owner.wrap(msg.sender);
    error OnlyOwner();

    modifier onlyOwner() {
        if (Owner.unwrap(owner) != msg.sender)
            revert OnlyOwner();
        _;
    }

    event OwnershipTransferred(Owner indexed previousOwner, Owner indexed newOwner);

    function setOwner(Owner newOwner) onlyOwner external {
        emit OwnershipTransferred({previousOwner: owner, newOwner: newOwner});
        owner = newOwner;
    }

    function renounceOwnership() onlyOwner external {
        owner = Owner.wrap(address(0));
    }
}
