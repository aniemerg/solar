//@ compile-flags: -Ztypeck
contract c {
    event e(uint indexed a, bytes3 indexed indexed s, bool indexed indexed indexed b); //~ ERROR: `indexed` already specified
//~^ ERROR: `indexed` already specified
//~^^ ERROR: `indexed` already specified
    event e2(uint indexed indexed a, bytes3 indexed s); //~ ERROR: `indexed` already specified
}
