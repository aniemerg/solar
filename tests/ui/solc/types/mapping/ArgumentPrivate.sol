//@ compile-flags: -Ztypeck
contract C {
    function f(mapping(uint => uint) storage) private pure {
    }
}
