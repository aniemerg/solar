contract C {
  function f() public pure {
    function() pure pure g; //~ ERROR: state mutability already specified
  }
}
