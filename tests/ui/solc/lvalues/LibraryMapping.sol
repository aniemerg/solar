//@compile-flags: -Ztypeck
library L {
    function f(mapping(uint=>uint) storage x, mapping(uint=>uint) storage y) external {
        x = y; //~ ERROR: types in storage containing (nested) mappings cannot be assigned to
    }
}
