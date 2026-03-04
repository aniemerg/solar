//@ compile-flags: -Ztypeck
contract test {
    struct str {
        mapping(uint=>uint) map;
    }
    str data;
    function fun() public {
        mapping(uint=>uint) storage a = data.map;
        data.map = a; //~ ERROR: types in storage containing (nested) mappings cannot be assigned to
        (data.map) = a; //~ ERROR: types in storage containing (nested) mappings cannot be assigned to
        (data.map, data.map) = (a, a); //~ ERROR: types in storage containing (nested) mappings cannot be assigned to
//~^ ERROR: types in storage containing (nested) mappings cannot be assigned to
    }
}
