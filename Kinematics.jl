module Kinematics

abstract type UnitOfMeasure end
macro UnitOfMeasure(name)
    return :(
        struct $name{T <: Number} <: UnitOfMeasure
            value::T
        end
    )
end

@UnitOfMeasure Time
@UnitOfMeasure Velocity
@UnitOfMeasure Displacement

import Base.*
# Note we implement both orderings of the parameters for multiplication
*(v::Velocity, t::Time) = Displacement(v.value * t.value)
*(t::Time, v::Velocity) = Displacement(v.value * t.value)

import Base./
# Note that only one ordering of the parameters is permitted for division
/(d::Displacement, v::Velocity) = Time(d.value / v.value)

end # Kinematics module
