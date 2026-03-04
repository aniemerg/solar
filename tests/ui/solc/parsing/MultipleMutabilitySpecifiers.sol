contract C {
    uint constant constant a; //~ ERROR: mutability already specified
//~^ ERROR: constant variable must be initialized
    uint immutable immutable b; //~ ERROR: mutability already specified
    uint constant immutable c; //~ ERROR: mutability already specified
//~^ ERROR: constant variable must be initialized
    uint immutable constant d; //~ ERROR: mutability already specified
}
