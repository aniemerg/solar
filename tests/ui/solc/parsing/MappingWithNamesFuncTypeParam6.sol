//@ compile-flags: -Ztypeck
contract test {
    function(mapping(uint nameSame => mapping(uint name2 => mapping(uint nameSame => uint name3) name4) name5) storage) internal stateVariableName; //~ ERROR: invalid data location `storage`
}
