contract test {
    function fun() public { } //~ ERROR: function with same name and parameter types declared twice
    function fun() public { }
}
