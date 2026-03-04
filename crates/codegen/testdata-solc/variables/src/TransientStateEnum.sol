// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TransientStateEnum {
    enum Pets { Dog, Cat, Bird, Fish }
    Pets transient myPet;

    function f() public {
        myPet = Pets.Bird;
        this.g();
        assert(myPet == Pets.Cat);
    }
    function g() public {
        myPet = Pets.Cat;
    }
}
