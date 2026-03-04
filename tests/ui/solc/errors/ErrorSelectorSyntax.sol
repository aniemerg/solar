//@ compile-flags: -Ztypeck
library L {
    error E(bytes4, bool, bytes);
}

error E(bytes4, bool, bytes);

interface I {
    error E(bytes4, bool, bytes);
}

contract B {
    error E(bytes4, bool, bytes);
}

contract C is B {
    bytes4 public librarySelector = L.E.selector; //~ ERROR: member `E` not found on type `type(library L)`
    bytes4 internal freeSelector = E.selector;
    bytes4 internal contractSelector = B.E.selector; //~ ERROR: member `E` not found on type `type(contract B)`
    bytes4 private interfaceSelector = I.E.selector; //~ ERROR: member `E` not found on type `type(contract I)`

    function f(bool condition) public view {
        assert(librarySelector == L.E.selector); //~ ERROR: member `E` not found on type `type(library L)`
        assert(E.selector == B.E.selector); //~ ERROR: member `E` not found on type `type(contract B)`

        if (condition)
            revert E(E.selector, true, "123"); //~ ERROR: mismatched types
        else
            revert L.E((B.E.selector), true, "123"); //~ ERROR: member `E` not found on type `type(contract B)`
//~^ ERROR: mismatched types
    }
}
