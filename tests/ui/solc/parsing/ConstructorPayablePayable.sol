contract C {
  constructor() payable payable {} //~ ERROR: state mutability already specified
}
