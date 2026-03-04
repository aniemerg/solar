//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        abi.encodeWithSelector({selector:"abc"}); //~ ERROR: named arguments cannot be used for functions that take arbitrary parameters
    }
}
