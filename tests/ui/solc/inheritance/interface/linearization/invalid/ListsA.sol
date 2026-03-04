//@ compile-flags: -Ztypeck
interface ParentA {}
interface ParentB {}
interface Sub is ParentA, ParentB {}

contract ListsA is Sub, ParentA {} //~ ERROR: linearization of inheritance graph impossible
