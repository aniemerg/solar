//@ compile-flags: -Ztypeck
contract C {
    function f() pure public {
        assembly {
            let x := msize()
        }
    }
}
