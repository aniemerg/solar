//@ compile-flags: -Ztypeck
contract C {
    function f(function(mapping(uint=>uint) storage) external) public pure { //~ ERROR: invalid data location `storage`
    }
}
