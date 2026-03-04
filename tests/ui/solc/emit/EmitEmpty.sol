contract C {
  function f() public {
    emit; //~ ERROR: expected identifier, found `;`
  }
}
