//@ compile-flags: -Ztypeck
// This contract used to throw
abstract contract D { //~ ERROR: function signature hash collision
    function gsf() public {}
    function tgeo() public {}
}
contract C {
    D d;
    function g() public returns (uint) {
        d.d;
    }
}
