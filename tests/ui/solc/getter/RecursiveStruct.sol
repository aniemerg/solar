contract C {
    struct Y {
        Y[] x;
    }
    mapping(uint256 => Y) public m; //~ ERROR: getter must return at least one value
}
