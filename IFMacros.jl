module IFMacros

export @Struct

"""
Macro to concisely define a struct with a single field.
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

end #IFMacros
