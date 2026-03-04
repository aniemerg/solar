// Previous versions of Solidity turned this
// into a parser error (they wrongly recognized
// these functions as state variables of
// function type).
abstract contract C
{
    modifier only_owner() { _; }
    function foo() only_owner public virtual; //~ ERROR: functions without implementation cannot have modifiers
    function bar() public only_owner virtual; //~ ERROR: functions without implementation cannot have modifiers
}
