contract C {
    enum EnumType {A, B, C}

    struct StructType {
        uint x;
    }

    function () external returns (StructType memory StructType) ext1; //~ WARN: named function type parameters are deprecated
//~^ ERROR: return parameters in function types may not be named
    function () external returns (EnumType EnumType) ext2; //~ WARN: named function type parameters are deprecated
//~^ ERROR: return parameters in function types may not be named
    function () external returns (EnumType StructType, StructType memory EnumType) ext3; //~ WARN: named function type parameters are deprecated
//~^ WARN: named function type parameters are deprecated
//~^^ ERROR: return parameters in function types may not be named
//~^^^ ERROR: return parameters in function types may not be named
}
