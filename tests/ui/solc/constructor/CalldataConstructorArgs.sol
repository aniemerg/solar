contract C {
    constructor(uint[] calldata) public {} //~ ERROR: invalid data location `calldata`
}
