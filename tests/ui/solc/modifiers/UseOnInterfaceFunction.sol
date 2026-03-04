interface I {
  function f() external m pure returns (uint); //~ ERROR: functions in interfaces cannot have modifiers
  modifier m() { _; }
}
