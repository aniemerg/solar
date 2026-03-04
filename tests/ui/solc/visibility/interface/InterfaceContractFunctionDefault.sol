// State of the syntax checker has to be reset after the interface
// was visited. The suggested visibility for g() should not be external.
interface I {
    function f(); //~ ERROR: no visibility specified
}
abstract contract C {
    function g() {} //~ ERROR: no visibility specified
}
