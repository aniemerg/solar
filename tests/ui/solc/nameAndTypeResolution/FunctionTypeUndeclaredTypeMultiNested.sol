//@ compile-flags: -Ztypeck
contract C {
    function a(function(function(function(Nested)))) external pure {} //~ ERROR: unresolved symbol `Nested`
}
