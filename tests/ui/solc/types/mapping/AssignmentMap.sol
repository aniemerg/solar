//@ compile-flags: -Ztypeck
contract C {
    mapping (uint => address payable [ ]) public a = a ; //~ ERROR: types in storage containing (nested) mappings cannot be assigned to
}

contract D {
    mapping (uint => uint) a;
    mapping (uint => uint) b = a; //~ ERROR: types in storage containing (nested) mappings cannot be assigned to
}

contract F {
    mapping (uint => uint) a;
    mapping (uint => uint) b;

    function foo() public {
        a = b; //~ ERROR: types in storage containing (nested) mappings cannot be assigned to
    }
}

contract G {
    uint x = 1;
    mapping (uint => uint) b = x; //~ ERROR: types in storage containing (nested) mappings cannot be assigned to
}

contract H {
    struct S {mapping (uint => uint) a;}

	S x;
	S y = x; //~ ERROR: types in storage containing (nested) mappings cannot be assigned to
	S z = z; //~ ERROR: types in storage containing (nested) mappings cannot be assigned to
}
