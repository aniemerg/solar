//@ compile-flags: -Ztypeck
contract A {
    function() external public f;
}
contract B {
    function() external public g;
}

contract C is B {
    function() external public h;
    bytes4 constant s1 = h.selector;
    bytes4 constant s2 = B.g.selector; //~ ERROR: member `g` not found on type `type(contract B)`
    bytes4 constant s3 = this.h.selector;
}
