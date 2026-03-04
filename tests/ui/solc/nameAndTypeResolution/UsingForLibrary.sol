//@ compile-flags: -Ztypeck
library D { }
contract C {
    using D for uint;
}
