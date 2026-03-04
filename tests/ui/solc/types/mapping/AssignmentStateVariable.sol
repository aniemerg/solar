//@ compile-flags: -Ztypeck
contract test {
    mapping(uint=>uint) map;
    function fun() public {
        mapping(uint=>uint) storage a = map;
        map = a; //~ ERROR: types in storage containing (nested) mappings cannot be assigned to
        (map) = a; //~ ERROR: types in storage containing (nested) mappings cannot be assigned to
        (map, map) = (a, a); //~ ERROR: types in storage containing (nested) mappings cannot be assigned to
//~^ ERROR: types in storage containing (nested) mappings cannot be assigned to
    }
}
