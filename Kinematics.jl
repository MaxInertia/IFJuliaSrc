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

import Base.*
# Note we implement both orderings of the parameters for multiplication
*(v::Velocity, t::Time) = Displacement(v.value * t.value)
*(t::Time, v::Velocity) = Displacement(v.value * t.value)

import Base./
# Note that only one ordering of the parameters is permitted for division
/(d::Displacement, v::Velocity) = Time(d.value / v.value)
