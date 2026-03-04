//@ compile-flags: -Ztypeck
contract c {
    mapping(uint => uint) y;
    function f() view public {
        mapping(uint => uint) calldata x = y; //~ ERROR: type `mapping(uint256 => uint256)` is only valid in storage because it contains a (nested) mapping
        x;
    }
}
