//@ compile-flags: -Ztypeck
library test {
    function f(bytes transient) internal pure {} //~ ERROR: expected data location
}
