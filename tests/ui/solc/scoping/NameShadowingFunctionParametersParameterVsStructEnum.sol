library C {
    enum EnumType {A, B, C}

    struct StructType {
        uint x;
    }

    function f1(function (StructType memory StructType) external f) external {} //~ WARN: named function type parameters are deprecated
    function f2(function (EnumType EnumType) external f) external {} //~ WARN: named function type parameters are deprecated
    function f3(function (EnumType StructType, StructType memory EnumType) external f) external {} //~ WARN: named function type parameters are deprecated
//~^ WARN: named function type parameters are deprecated
//~^^ ERROR: name has to refer to a valid user-defined type
}
