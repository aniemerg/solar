contract C {
    modifier m() { _; }
}
contract D is C {
    function f() super.m public { //~ ERROR: `super` is a builtin, which cannot be indexed in type paths
    }
}
