contract test {
    function f() pure public { "abc\ //~ ERROR: unterminated string
//~^ ERROR: expected one of `(`, `.`, `;`, `?`, `[`, or `{`, found `<eof>`
