contract C {
    uint storage x; //~ ERROR: data location can only be specified for array, struct or mapping types
}
