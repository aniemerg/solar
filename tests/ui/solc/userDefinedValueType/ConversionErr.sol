//@ compile-flags: -Ztypeck
type MyAddress is address;
function f() {
    MyAddress a = MyAddress(5, 2); //~ ERROR: expected exactly one unnamed argument
}
