//@ compile-flags: -Ztypeck
abstract contract X { function test() private virtual returns (uint256); } //~ ERROR: "virtual" and "private" cannot be used together
contract Y is X {
    uint256 public override test = 42;
}
contract T {
    constructor() { new Y(); }
}
