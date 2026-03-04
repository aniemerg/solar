//@ compile-flags: -Ztypeck
contract A {
    function() external public f;
}

contract C {
    bytes4 constant s4 = A.f.selector; //~ ERROR: member `f` not found on type `type(contract A)`
}
