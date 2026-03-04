//@ compile-flags: -Ztypeck
contract C {
    function(uint) returns (bool ret) f; //~ WARN: named function type parameters are deprecated
//~^ ERROR: return parameters in function types may not be named
}
