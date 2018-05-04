module IFMacros

"""
Macro to concisely define a struct with a single field.
Example Usage:
    `@Struct Quantity{T <: Number} value T`
"""
macro Struct(structName, field, fieldType)
    return :(
        struct $structName
            $field::$fieldType
        end
    )
end

end #IFMacros
