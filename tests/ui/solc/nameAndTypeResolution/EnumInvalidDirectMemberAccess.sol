//@ compile-flags: -Ztypeck
contract test {
    enum ActionChoices { GoLeft, GoRight, GoStraight, Sit }
    constructor() {
        choices = Sit; //~ ERROR: unresolved symbol `Sit`
    }
    ActionChoices choices;
}
