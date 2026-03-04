contract C {
    struct S {
        mapping(uint => uint) c;
    }
    S public constant e = 0x1212121212121212121212121212121212121212; //~ ERROR: getter must return at least one value
}
