//@ compile-flags: -Ztypeck
contract C {
    event a(bool payable); //~ ERROR: only address types can have state mutability
    event b(string payable); //~ ERROR: only address types can have state mutability
    event c(int payable); //~ ERROR: only address types can have state mutability
    event d(int256 payable); //~ ERROR: only address types can have state mutability
    event e(uint payable); //~ ERROR: only address types can have state mutability
    event f(uint256 payable); //~ ERROR: only address types can have state mutability
    event g(bytes1 payable); //~ ERROR: only address types can have state mutability
    event h(bytes payable); //~ ERROR: only address types can have state mutability
    event i(bytes32 payable); //~ ERROR: only address types can have state mutability
    event j(fixed payable); //~ ERROR: only address types can have state mutability
    event k(fixed80x80 payable); //~ ERROR: expected identifier, found keyword `payable`
    event l(ufixed payable); //~ ERROR: only address types can have state mutability
    event m(ufixed80x80 payable); //~ ERROR: expected identifier, found keyword `payable`
}
contract C2 {
    event a(bool view); //~ ERROR: only address types can have state mutability
    event b(string view); //~ ERROR: only address types can have state mutability
    event c(int view); //~ ERROR: only address types can have state mutability
    event d(int256 view); //~ ERROR: only address types can have state mutability
    event e(uint view); //~ ERROR: only address types can have state mutability
    event f(uint256 view); //~ ERROR: only address types can have state mutability
    event g(bytes1 view); //~ ERROR: only address types can have state mutability
    event h(bytes view); //~ ERROR: only address types can have state mutability
    event i(bytes32 view); //~ ERROR: only address types can have state mutability
    event j(fixed view); //~ ERROR: only address types can have state mutability
    event k(fixed80x80 view); //~ ERROR: expected identifier, found keyword `view`
    event l(ufixed view); //~ ERROR: only address types can have state mutability
    event m(ufixed80x80 view); //~ ERROR: expected identifier, found keyword `view`
}
contract C3 {
    event a(bool pure); //~ ERROR: only address types can have state mutability
    event b(string pure); //~ ERROR: only address types can have state mutability
    event c(int pure); //~ ERROR: only address types can have state mutability
    event d(int256 pure); //~ ERROR: only address types can have state mutability
    event e(uint pure); //~ ERROR: only address types can have state mutability
    event f(uint256 pure); //~ ERROR: only address types can have state mutability
    event g(bytes1 pure); //~ ERROR: only address types can have state mutability
    event h(bytes pure); //~ ERROR: only address types can have state mutability
    event i(bytes32 pure); //~ ERROR: only address types can have state mutability
    event j(fixed pure); //~ ERROR: only address types can have state mutability
    event k(fixed80x80 pure); //~ ERROR: expected identifier, found keyword `pure`
    event l(ufixed pure); //~ ERROR: only address types can have state mutability
    event m(ufixed80x80 pure); //~ ERROR: expected identifier, found keyword `pure`
}
