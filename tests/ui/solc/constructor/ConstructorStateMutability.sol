contract test1 {
  constructor() view {} //~ ERROR: `view` not allowed here; allowed values: payable
}
contract test2 {
  constructor() pure {} //~ ERROR: `pure` not allowed here; allowed values: payable
}
