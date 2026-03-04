contract C {
    function f() public pure {
        uint[][1:] memory x; //~ ERROR: expected array length, got range expression
        uint[][1:2] memory x; //~ ERROR: expected array length, got range expression
        uint[1:] memory x; //~ ERROR: expected array length, got range expression
        uint[1:2] memory x; //~ ERROR: expected array length, got range expression
    }
}
