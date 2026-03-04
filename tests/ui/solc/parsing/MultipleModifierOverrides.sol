contract C {
    modifier f() override override {} //~ ERROR: override already specified
//~^ ERROR: modifier must have a `_;` placeholder statement
}
