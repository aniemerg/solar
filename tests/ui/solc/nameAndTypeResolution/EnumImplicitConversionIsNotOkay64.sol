//@ compile-flags: -Ztypeck
contract test {
    enum ActionChoices { GoLeft, GoRight, GoStraight, Sit }
    constructor() {
        b = ActionChoices.Sit; //~ ERROR: mismatched types
    }
    uint64 b;
}
