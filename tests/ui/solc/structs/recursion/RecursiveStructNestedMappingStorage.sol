//@ compile-flags: -Ztypeck
library a {
    struct b {
        mapping (uint => b) c ;
    }
    function d(b storage) public {}
}
