contract C {
    function f() public pure layout at 32 { } //~ ERROR: expected one of `;`, `external`, `internal`, `override`, `payable`, `private`, `public`, `pure`, `returns`, `view`, `virtual`, or `{`, found `<integer>`
}
