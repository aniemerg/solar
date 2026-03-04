contract A {
    modifier mod1(uint constant a) { _; } //~ ERROR: mutability is not allowed here
    modifier mod2(uint immutable a) { _; } //~ ERROR: mutability is not allowed here
}
