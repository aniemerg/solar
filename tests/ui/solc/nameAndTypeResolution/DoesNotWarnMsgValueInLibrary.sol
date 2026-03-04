//@ compile-flags: -Ztypeck
library C {
    function f() view public {
        msg.value;
    }
}
