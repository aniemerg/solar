//@ compile-flags: -Ztypeck
// bug #1798 (cpp-ethereum), related to #1286 (solidity)
contract attribute {
    bool ok = false;
}
contract func {
    function ok() public returns (bool) { return true; } //~ ERROR: identifier `ok` already declared
}
contract attr_func is attribute, func {
    function checkOk() public returns (bool) { return ok(); }
}
