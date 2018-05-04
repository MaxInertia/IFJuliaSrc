#__precompile__(true)

module Kinematics

#include("IFMacros.jl")
using IFMacros

uom(name) = :(@Struct $name{T<:Number} value T)

UnitsOfMeasure = [:Time,
                  :Velocity,
                  :Displacement]

function __init__()
    for u in UnitsOfMeasure

        # evaluate each returned struct-definition literal
        eval(uom(u))

        # Attempt at creating global type aliases
        eval(:(const $u = Kinematics.$u))
        #eval(:(global const $u = Kinematics.$u))
        #export :($u)
        # This may need to be done on the users side? =S

    end
    println("Initialized Kinematics.")
end

# NOTE: This change breaks the following method declarations.
# ERROR: LoadError: UndefVarError: Velocity not defined

#import Base.*
# Note we implement both orderings of the parameters for multiplication
#*(v::Velocity, t::Time) = Displacement(v.value * t.value)
#*(t::Time, v::Velocity) = Displacement(v.value * t.value)

#import Base./
# Note that only one ordering of the parameters is permitted for division
#/(d::Displacement, v::Velocity) = Time(d.value / v.value)

end #Kinematics
