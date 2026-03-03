// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A1 {}

contract B1 is A1 {
    constructor() payable {}
}

contract A2 {
    constructor() {}
}

contract B2 is A2 {
    constructor() payable {}
}

contract B3 {
    constructor() payable {}
}

contract NoCallvalueCheck {
    function f() public payable returns (bool) {
        new B1{value: 10, salt: hex"00"}();
        new B2{value: 10, salt: hex"01"}();
        new B3{value: 10, salt: hex"02"}();
        return true;
    }
}
