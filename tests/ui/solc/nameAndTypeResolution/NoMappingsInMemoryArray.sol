//@ compile-flags: -Ztypeck
contract C {
    function f() public {
        mapping(uint=>uint)[] memory x; //~ ERROR: type `mapping(uint256 => uint256)[] memory` is only valid in storage because it contains a (nested) mapping
    }
}
