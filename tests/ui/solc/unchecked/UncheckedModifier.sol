contract C {
    modifier m() { unchecked { _; } } //~ ERROR: placeholder statements cannot be used inside unchecked blocks
}
