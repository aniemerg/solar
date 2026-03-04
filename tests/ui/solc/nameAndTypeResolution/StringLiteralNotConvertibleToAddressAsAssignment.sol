//@ compile-flags: -Ztypeck
// A previous implementation claimed the string would be an address
contract AddrString {
    address public test = "0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c"; //~ ERROR: mismatched types
}
