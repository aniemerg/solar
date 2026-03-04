//@ compile-flags: -Ztypeck
contract test {
    enum ActionChoices { GoLeft, GoRight, GoStraight, Sit }
    constructor() {
        choices = ActionChoices.RunAroundWavingYourHands; //~ ERROR: member `RunAroundWavingYourHands` not found on type `type(enum test.ActionChoices)`
    }
    ActionChoices choices;
}
