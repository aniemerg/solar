//@ compile-flags: -Ztypeck
contract test {
    enum Paper { Up, Down, Left, Right }
    enum Ground { North, South, West, East }
    constructor() {
        Ground(Paper.Up); //~ ERROR: invalid explicit type conversion
    }
}
