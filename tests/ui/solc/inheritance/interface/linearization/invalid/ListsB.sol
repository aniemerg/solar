//@ compile-flags: -Ztypeck
interface ParentA {}
interface ParentB {}
interface Sub is ParentA, ParentB {}

contract ListsB is Sub, ParentB {} //~ ERROR: linearization of inheritance graph impossible
