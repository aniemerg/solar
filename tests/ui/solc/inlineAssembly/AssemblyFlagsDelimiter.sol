//@ compile-flags: -Ztypeck
function f() pure {
	assembly ("a" "b") {} //~ ERROR: expected one of `)` or `,`, found `<string>`
}
