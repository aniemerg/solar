contract C {
    function f(bool b) public pure
    {
        uint a = 10; ‬ //~ ERROR: unknown start of token: \u{202c}
    }
}
