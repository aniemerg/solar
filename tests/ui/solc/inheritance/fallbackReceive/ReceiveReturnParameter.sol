//@ compile-flags: -Ztypeck
contract C {
    receive() external payable virtual returns(uint) {} //~ ERROR: expected one of `;`, `external`, `internal`, `override`, `payable`, `private`, `public`, `pure`, `view`, `virtual`, or `{`, found keyword `returns`
}
contract D is C {
    receive() external payable override {}
}
