contract test {
    function f() public pure returns (string memory) {
        return "😃, 😭, and 😈"; //~ ERROR: unicode characters are not allowed in string literals; use a `unicode"..."` literal instead
//~^ ERROR: unicode characters are not allowed in string literals; use a `unicode"..."` literal instead
//~^^ ERROR: unicode characters are not allowed in string literals; use a `unicode"..."` literal instead
    }
}
