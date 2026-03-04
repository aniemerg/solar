// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

type MyAddress is address;

contract WrapUnwrap {
    function f() pure public {
        MyAddress.wrap;
        MyAddress.unwrap;
    }
}
