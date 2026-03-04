//@ compile-flags: -Ztypeck
abstract contract A {
    constructor(mapping(uint => uint) memory a) {} //~ ERROR: type `mapping(uint256 => uint256)` is only valid in storage because it contains a (nested) mapping
}
