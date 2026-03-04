// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Ownable.sol";
import {Test} from "forge-std/Test.sol";

contract OwnableTest is Test {
    Ownable c;
    address deployer;

    function setUp() public {
        deployer = address(this);
        c = new Ownable();
    }

    function test_initialOwner() public {
        assert(Ownable.Owner.unwrap(c.owner()) == deployer);
    }

    function test_setOwner() public {
        Ownable.Owner newOwner = Ownable.Owner.wrap(deployer);
        c.setOwner(newOwner);
        assert(Ownable.Owner.unwrap(c.owner()) == deployer);
    }

    function test_renounceOwnership() public {
        c.renounceOwnership();
        assert(Ownable.Owner.unwrap(c.owner()) == address(0));
    }

    function test_setOwnerAfterRenounce_reverts() public {
        c.renounceOwnership();
        vm.expectRevert(Ownable.OnlyOwner.selector);
        c.setOwner(Ownable.Owner.wrap(deployer));
    }
}
