## Fun with MacroProgramming

### MP Structs!

```julia
macro Struct(structName, fieldWithType)
    return :(
        struct $structName
            $fieldWithType
        end
    )
end
```

This enables more concise struct definitions.

```julia
@Struct Velocity value::Number
@Struct Displacement value::Number
@Struct Time value::Number
```
You can use *Generics* too.

```julia
@Struct Velocity{T <: Number} value::T
@Struct Displacement{T <: Number} value::T
@Struct Time{T <: Number} value::T
```
