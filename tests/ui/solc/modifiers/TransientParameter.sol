contract A {
    modifier mod2(uint[] transient) { _; } //~ ERROR: expected data location
}
