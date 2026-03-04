// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ManySubassembliesC0 {}
contract ManySubassembliesC1 {}
contract ManySubassembliesC2 {}
contract ManySubassembliesC3 {}
contract ManySubassembliesC4 {}
contract ManySubassembliesC5 {}
contract ManySubassembliesC6 {}
contract ManySubassembliesC7 {}
contract ManySubassembliesC8 {}
contract ManySubassembliesC9 {}
contract ManySubassembliesC10 {}

contract ManySubassemblies {
    function run() public {
        new ManySubassembliesC0{salt: hex"00"}();
        new ManySubassembliesC1{salt: hex"01"}();
        new ManySubassembliesC2{salt: hex"02"}();
        new ManySubassembliesC3{salt: hex"03"}();
        new ManySubassembliesC4{salt: hex"04"}();
        new ManySubassembliesC5{salt: hex"05"}();
        new ManySubassembliesC6{salt: hex"06"}();
        new ManySubassembliesC7{salt: hex"07"}();
        new ManySubassembliesC8{salt: hex"08"}();
        new ManySubassembliesC9{salt: hex"09"}();
        new ManySubassembliesC10{salt: hex"0a"}();
    }
}
