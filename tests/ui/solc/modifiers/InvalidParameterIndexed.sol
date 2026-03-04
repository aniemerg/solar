contract B {
    modifier mod1(uint indexed a) { _; } //~ ERROR: `indexed` is not allowed here
}
