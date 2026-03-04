contract C {
	string s = "abc" ether; //~ ERROR: sub-denominations are only allowed on number and rational literals
}
