//@ compile-flags: -Ztypeck
contract C {
    function (uint transient) external y; //~ WARN: named function type parameters are deprecated
    function (uint[] transient) external z; //~ WARN: named function type parameters are deprecated
//~^ ERROR: expected data location
}
