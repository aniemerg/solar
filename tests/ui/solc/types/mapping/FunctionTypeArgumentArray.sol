//@ compile-flags: -Ztypeck
contract test {
    function f(mapping(uint => uint)[2] memory b) internal { //~ ERROR: type `mapping(uint256 => uint256)[2] memory` is only valid in storage because it contains a (nested) mapping
    }
}
