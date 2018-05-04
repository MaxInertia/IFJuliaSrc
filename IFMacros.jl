module IFMacros

export @Struct

"""
Concisely define a struct with a single field.
Example Usage:
    - `@Struct Quantity value::Number`
    - `@Struct(Quantity, value::Number)`
    - `@Struct(Quantity{T}, value: T)`
"""
macro Struct(structName, fieldWithType)
    return :(
        struct $structName
            $fieldWithType
        end
    )
end

"""
Concisely define a struct with two fields.
Example Usage:
    - `@Struct Quantity value::Number unit::Any`
    - `@Struct(Quantity, value::Number, unit::Any)`
    - `@Struct(Quantity{T}, value: T, unit::Any)`
"""
macro Struct(structName, field1, field2)
    return :(
        struct $structName
            $field1
            $field2
        end
    )
end

# TODO: Generalize this for any number of fields?
# TODO: What about structs extending abstract types?

end # IFMacros module
