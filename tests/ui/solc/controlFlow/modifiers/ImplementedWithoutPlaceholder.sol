abstract contract A {
    function f() public view mod {
        require(block.timestamp > 10);
    }
    modifier mod() virtual { } //~ ERROR: modifier must have a `_;` placeholder statement
}
