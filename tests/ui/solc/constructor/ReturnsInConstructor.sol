contract test {
	constructor() returns (uint a) { } //~ ERROR: expected one of `external`, `internal`, `override`, `payable`, `private`, `public`, `pure`, `view`, `virtual`, or `{`, found keyword `returns`
}
