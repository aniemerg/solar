//@ compile-flags: -Ztypeck
contract test {
    enum ActionChoices { GoLeft, GoRight, GoStraight, Sit }
    constructor()
    {
        choices = ActionChoices.GoStraight;
    }
    ActionChoices choices;
}
