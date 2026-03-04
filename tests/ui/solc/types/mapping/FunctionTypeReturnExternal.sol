//@ compile-flags: -Ztypeck
contract C {
    function f(function() external returns (mapping(uint=>uint) storage)) public pure { //~ ERROR: invalid data location `storage`
    }
}
