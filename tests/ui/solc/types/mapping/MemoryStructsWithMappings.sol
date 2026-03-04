//@ compile-flags: -Ztypeck
contract Test {
    struct S {
        uint8 a;
        mapping(uint256 => uint256) b;
        uint8 c;
    }
    S s;

    function f() public returns (uint256) {
        S memory x; //~ ERROR: type `struct Test.S memory` is only valid in storage because it contains a (nested) mapping
    }
}
