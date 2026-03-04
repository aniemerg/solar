//@ compile-flags: -Ztypeck
contract c {
    event e(uint a) anonymous anonymous; //~ ERROR: expected `;`, found keyword `anonymous`
}
