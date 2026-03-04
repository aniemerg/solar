//@ compile-flags: -Ztypeck
abstract contract A {
    constructor (mapping (uint => uint) [] storage) { }
}
