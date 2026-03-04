//@ compile-flags: -Ztypeck
contract c {
    function f() pure public { }
    modifier m() { msg.value; _; }
}
