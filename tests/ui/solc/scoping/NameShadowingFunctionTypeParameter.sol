contract C {
    enum EnumType {A, B, C}

    struct StructType {
        uint x;
    }

    function (StructType memory StructType) external ext1; //~ WARN: named function type parameters are deprecated
    function (EnumType EnumType) external ext2; //~ WARN: named function type parameters are deprecated
    function (EnumType StructType, StructType memory EnumType) external ext3; //~ WARN: named function type parameters are deprecated
//~^ WARN: named function type parameters are deprecated
//~^^ ERROR: name has to refer to a valid user-defined type
}
