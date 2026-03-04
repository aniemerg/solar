contract C {
    modifier a(bool payable) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier b(string payable) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier c(int payable) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier d(int256 payable) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier e(uint payable) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier f(uint256 payable) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier g(bytes1 payable) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier h(bytes payable) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier i(bytes32 payable) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier j(fixed payable) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier k(fixed80x80 payable) {} //~ ERROR: expected identifier, found keyword `payable`
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier l(ufixed payable) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier m(ufixed80x80 payable) {} //~ ERROR: expected identifier, found keyword `payable`
//~^ ERROR: modifier must have a `_;` placeholder statement
}
contract C2 {
    modifier a(bool view) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier b(string view) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier c(int view) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier d(int256 view) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier e(uint view) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier f(uint256 view) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier g(bytes1 view) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier h(bytes view) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier i(bytes32 view) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier j(fixed view) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier k(fixed80x80 view) {} //~ ERROR: expected identifier, found keyword `view`
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier l(ufixed view) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier m(ufixed80x80 view) {} //~ ERROR: expected identifier, found keyword `view`
//~^ ERROR: modifier must have a `_;` placeholder statement
}
contract C3 {
    modifier a(bool pure) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier b(string pure) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier c(int pure) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier d(int256 pure) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier e(uint pure) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier f(uint256 pure) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier g(bytes1 pure) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier h(bytes pure) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier i(bytes32 pure) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier j(fixed pure) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier k(fixed80x80 pure) {} //~ ERROR: expected identifier, found keyword `pure`
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier l(ufixed pure) {} //~ ERROR: only address types can have state mutability
//~^ ERROR: modifier must have a `_;` placeholder statement
    modifier m(ufixed80x80 pure) {} //~ ERROR: expected identifier, found keyword `pure`
//~^ ERROR: modifier must have a `_;` placeholder statement
}
