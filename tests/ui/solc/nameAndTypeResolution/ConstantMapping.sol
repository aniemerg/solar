//@ compile-flags: -Ztypeck
contract C {
    mapping(uint => uint) constant x; //~ ERROR: constant variable must be initialized
}
