//@ compile-flags: -Ztypeck
contract C {
    function f(address) external pure {} //~ ERROR: function overload clash during conversion to external types for arguments
    function f(address payable) external pure {}

}
