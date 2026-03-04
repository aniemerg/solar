//@ compile-flags: -Ztypeck
struct s1 { s2 x; } //~ ERROR: recursive struct definition
struct s2 { s1 y; } //~ ERROR: recursive struct definition

contract C {
    // whatever
}
