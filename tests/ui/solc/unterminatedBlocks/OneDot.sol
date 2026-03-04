contract c {
    function f() pure public { 1. //~ ERROR: empty rational
//~^ ERROR: expected one of `(`, `.`, `;`, `?`, `[`, or `{`, found `<eof>`
