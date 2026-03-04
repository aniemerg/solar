contract c {
    function f() pure public { 0. //~ ERROR: empty rational
//~^ ERROR: expected one of `(`, `.`, `;`, `?`, `[`, or `{`, found `<eof>`
