//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        function(uint a) returns (uint) x; //~ WARN: named function type parameters are deprecated
        x({a:2}); //~ ERROR: named arguments cannot be used for functions that take arbitrary parameters
    }
}
