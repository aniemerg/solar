//@ compile-flags: -Ztypeck
contract C {
    function (uint transient x) external transient y; //~ WARN: named function type parameters are deprecated
//~^ ERROR: data location can only be specified for array, struct or mapping types
}
