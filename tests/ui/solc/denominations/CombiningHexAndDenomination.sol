contract C {
	uint constant x = 0x01 wei; //~ ERROR: hexadecimal numbers cannot be used with unit denominations
}
