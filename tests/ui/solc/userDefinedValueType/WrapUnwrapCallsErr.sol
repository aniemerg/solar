//@ compile-flags: -Ztypeck
type MyInt is int;
function f() {
    MyInt.wrap(5, 6, 7); //~ ERROR: wrong argument count for function call: 3 arguments given but expected 1
    MyInt.wrap({test: 5}); //~ ERROR: named arguments cannot be used for functions that take arbitrary parameters
    MyInt.wrap(); //~ ERROR: wrong argument count for function call: 0 arguments given but expected 1
    MyInt.unwrap(5); //~ ERROR: mismatched types
    MyInt.unwrap({test: 5}); //~ ERROR: named arguments cannot be used for functions that take arbitrary parameters
    MyInt.unwrap(MyInt.wrap(1), MyInt.wrap(2)); //~ ERROR: wrong argument count for function call: 2 arguments given but expected 1
}
