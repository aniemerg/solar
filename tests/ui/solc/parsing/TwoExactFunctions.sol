//@ compile-flags: -Ztypeck
// with support of overloaded functions, during parsing,
// we can't determine whether they match exactly, however
// it will throw DeclarationError in following stage.
contract test {
    function fun(uint a) public returns(uint r) { return a; } //~ ERROR: function with same name and parameter types declared twice
    function fun(uint a) public returns(uint r) { return a; }
}
