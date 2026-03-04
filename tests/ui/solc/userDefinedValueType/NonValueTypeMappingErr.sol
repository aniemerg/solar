//@ compile-flags: -Ztypeck
type MyInt is mapping(uint => uint); //~ ERROR: the underlying type of UDVTs must be an elementary value type
