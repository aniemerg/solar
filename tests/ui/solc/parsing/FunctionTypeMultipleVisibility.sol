contract C {
  function f() public pure {
    function() public public g; //~ ERROR: visibility is not allowed here
  }
}
