//@ compile-flags: -Ztypeck
contract test {
    enum ActionChoices { GoLeft, GoRight, GoStraight, Sit }
    constructor() {
        a = ActionChoices.GoStraight; //~ ERROR: mismatched types
    }
    uint256 a;
}
