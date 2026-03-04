//@ compile-flags: -Ztypeck
type MyFunction is function(MyFunction) external returns(MyFunction); //~ ERROR: the underlying type of UDVTs must be an elementary value type
