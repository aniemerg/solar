// This used to crash with some compiler versions.
contract SomeContract {

  uint public balance = 0;

  function balance(uint number) public {} //~ ERROR: identifier `balance` already declared

  function doSomething() public {
    balance(3);
  }
}
