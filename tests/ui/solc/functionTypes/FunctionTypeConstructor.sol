//@ compile-flags: -Ztypeck
contract C {
    // Fool parser into parsing a constructor as a function type.
    constructor() x; //~ ERROR: expected one of `external`, `internal`, `override`, `payable`, `private`, `public`, `pure`, `view`, `virtual`, or `{`, found `;`
}
