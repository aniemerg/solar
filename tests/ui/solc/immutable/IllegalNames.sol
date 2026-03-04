contract C {
    uint immutable super; //~ ERROR: identifier `super` already declared
    uint immutable _;
    uint immutable this; //~ ERROR: identifier `this` already declared
}
