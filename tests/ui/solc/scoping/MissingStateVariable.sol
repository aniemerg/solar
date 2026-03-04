//@ compile-flags: -Ztypeck
contract Scope {
    function getStateVar() view public returns (uint stateVar) {
        stateVar = Scope.stateVar; // should fail.
//~^ ERROR: member `stateVar` not found on type `type(contract Scope)`
    }
}
