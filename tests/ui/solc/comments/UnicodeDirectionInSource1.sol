contract C {
    function f(bool b) public pure
    {
        if ‬(b) { return; } //~ ERROR: unknown start of token: \u{202c}
    }
}
