contract C {
	bool constant x = true ether; //~ ERROR: sub-denominations are only allowed on number and rational literals
}
