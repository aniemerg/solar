//@ compile-flags: -Ztypeck
contract test { //~ ERROR: function signature hash collision
    function gsf() public { }
    function tgeo() public { }
}
