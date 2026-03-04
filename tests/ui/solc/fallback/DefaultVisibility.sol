contract C {
    // Check that visibility is also enforced for the fallback function.
    fallback() {} //~ ERROR: no visibility specified
}
