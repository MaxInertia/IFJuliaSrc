# This way of introducing Units is fairly concise, but repetitive.
abstract type UnitOfMeasure end
struct Velocity{T <: Number} <: UnitOfMeasure
    value::T
end
struct Time{T <: Number} <: UnitOfMeasure
    value::T
end
struct Displacement{T <: Number} <: UnitOfMeasure
    value::T
end
# Would benefit if abstract types could have fields. Example:
#=
abstract type Unit{T <: Number}
    value::T
end
=#
# Alternatively subtype non-abstract struct. Ex:
#=
struct Unit{T <: Number}
    value::T
end
struct Velocity{T <: Number} <: Unit{T} end
=#

import Base.*
# Note we implement both orderings of the parameters for multiplication
*(v::Velocity, t::Time) = Displacement(v.value * t.value)
*(t::Time, v::Velocity) = Displacement(v.value * t.value)

import Base./
# Note that only one ordering of the parameters is permitted for division
/(d::Displacement, v::Velocity) = Time(d.value / v.value)
