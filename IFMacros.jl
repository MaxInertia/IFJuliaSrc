module IFMacros

export @Struct

"""
Concisely define a struct with a single field.
Example Usage:
    - `@Struct Quantity value Number`
    - `@Struct(Quantity, value, Number)`
"""
macro Struct(structName, field, fieldType)
    return :(
        struct $structName
            $field::$fieldType
        end
    )
end

"""
Concisely define a struct with two fields.
Example Usage:
    - `@Struct Quantity value Number unit Any`
    - `@Struct(Quantity, value, Number, unit, Any)`
"""
macro Struct(structName, field1Name, field1Type, field2Name, field2Type)
    return :(
        struct $structName
            $field1Name::$field1Type
            $field2Name::$field2Type
        end
    )
end

# TODO: Generalize this for any number of fields?
# TODO: What about structs extending abstract types?

end # IFMacros module
