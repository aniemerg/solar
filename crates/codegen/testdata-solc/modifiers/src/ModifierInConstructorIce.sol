// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// The IR of this contract used to throw
contract A { modifier m1{_;} }
contract ModifierInConstructorIce is A { constructor() A() m1{} }
