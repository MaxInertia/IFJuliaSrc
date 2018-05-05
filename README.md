## Fun with MetaProgramming

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

This enables (slightly) more concise struct definitions:

```julia
@Struct Time value::Number
@Struct Velocity value::Number
@Struct Displacement value::Number
```
You can use *Generics* too:

```julia
@Struct Time{T} value::T
@Struct Velocity{T} value::T
@Struct Displacement{T} value::T
```

*Generics* with *Type Constraints*:
```julia
@Struct Time{T <: Number} value::T
@Struct Velocity{T <: Number} value::T
@Struct Displacement{T <: Number} value::T
```
