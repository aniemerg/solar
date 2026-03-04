//@ compile-flags: -Ztypeck
interface I {}
contract J {}
contract C {
    mapping(I => bool) i;
    mapping(J => bool) j;
    function f(I x, J y, address z) public view returns (bool, bool, bool) {
        return (i[y], j[x], i[z]); //~ ERROR: mismatched types
//~^ ERROR: mismatched types
//~^^ ERROR: mismatched types
    }
}
