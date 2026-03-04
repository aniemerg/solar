//@ compile-flags: -Ztypeck
contract C {
    error a(bool payable); //~ ERROR: only address types can have state mutability
    error b(string payable); //~ ERROR: only address types can have state mutability
    error c(int payable); //~ ERROR: only address types can have state mutability
    error d(int256 payable); //~ ERROR: only address types can have state mutability
    error e(uint payable); //~ ERROR: only address types can have state mutability
    error f(uint256 payable); //~ ERROR: only address types can have state mutability
    error g(bytes1 payable); //~ ERROR: only address types can have state mutability
    error h(bytes payable); //~ ERROR: only address types can have state mutability
    error i(bytes32 payable); //~ ERROR: only address types can have state mutability
    error j(fixed payable); //~ ERROR: only address types can have state mutability
    error k(fixed80x80 payable); //~ ERROR: expected identifier, found keyword `payable`
    error l(ufixed payable); //~ ERROR: only address types can have state mutability
    error m(ufixed80x80 payable); //~ ERROR: expected identifier, found keyword `payable`
}
contract C2 {
    error a(bool view); //~ ERROR: only address types can have state mutability
    error b(string view); //~ ERROR: only address types can have state mutability
    error c(int view); //~ ERROR: only address types can have state mutability
    error d(int256 view); //~ ERROR: only address types can have state mutability
    error e(uint view); //~ ERROR: only address types can have state mutability
    error f(uint256 view); //~ ERROR: only address types can have state mutability
    error g(bytes1 view); //~ ERROR: only address types can have state mutability
    error h(bytes view); //~ ERROR: only address types can have state mutability
    error i(bytes32 view); //~ ERROR: only address types can have state mutability
    error j(fixed view); //~ ERROR: only address types can have state mutability
    error k(fixed80x80 view); //~ ERROR: expected identifier, found keyword `view`
    error l(ufixed view); //~ ERROR: only address types can have state mutability
    error m(ufixed80x80 view); //~ ERROR: expected identifier, found keyword `view`
}
contract C3 {
    error a(bool pure); //~ ERROR: only address types can have state mutability
    error b(string pure); //~ ERROR: only address types can have state mutability
    error c(int pure); //~ ERROR: only address types can have state mutability
    error d(int256 pure); //~ ERROR: only address types can have state mutability
    error e(uint pure); //~ ERROR: only address types can have state mutability
    error f(uint256 pure); //~ ERROR: only address types can have state mutability
    error g(bytes1 pure); //~ ERROR: only address types can have state mutability
    error h(bytes pure); //~ ERROR: only address types can have state mutability
    error i(bytes32 pure); //~ ERROR: only address types can have state mutability
    error j(fixed pure); //~ ERROR: only address types can have state mutability
    error k(fixed80x80 pure); //~ ERROR: expected identifier, found keyword `pure`
    error l(ufixed pure); //~ ERROR: only address types can have state mutability
    error m(ufixed80x80 pure); //~ ERROR: expected identifier, found keyword `pure`
}
