//@ compile-flags: -Ztypeck
library L {
    function f(function(uint) internal returns (uint) /*x*/) pure internal {
    }
}
