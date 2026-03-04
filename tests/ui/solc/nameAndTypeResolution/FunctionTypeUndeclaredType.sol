//@ compile-flags: -Ztypeck
contract C {
    function a(function(Nested)) external pure {} //~ ERROR: unresolved symbol `Nested`
}
