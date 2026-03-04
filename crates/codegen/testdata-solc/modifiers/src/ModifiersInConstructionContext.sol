// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// The IR of this contract used to throw
contract A {
  constructor() m1 { }
  modifier m1 { _; }
}
contract ModifiersInConstructionContext is A {
  modifier m2 { _; }
  constructor() A() m1 m2 {  }
}
