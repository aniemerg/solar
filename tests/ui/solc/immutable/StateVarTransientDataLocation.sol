contract C {
    uint public immutable transient x; //~ ERROR: transient cannot be used as data location for constant or immutable variables
}
