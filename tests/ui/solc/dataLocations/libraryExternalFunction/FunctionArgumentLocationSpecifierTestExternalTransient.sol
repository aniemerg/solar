//@ compile-flags: -Ztypeck
library test {
    function f(bytes transient) external {} //~ ERROR: expected data location
}
