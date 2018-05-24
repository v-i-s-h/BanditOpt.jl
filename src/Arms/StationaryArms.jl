# This file defines staionary arm models

"""
    StationaryArmBase

`StationaryArmBase` is the concrete type for all the stationary arm models. Any
subtype should implement ```pull!()``` method
"""
abstract type StationaryArmBase end

"""
    Bernoulli( p )
`Bernoulli` creates a Bernoulli arm with success probability `p`.
"""
type Bernoulli <: StationaryArmBase
    armDist::Distributions.Bernoulli

    function Bernoulli( p::Real )
        new( Distributions.Bernoulli(p) )
    end
end

function pull!( arm::Bernoulli )
    return Distributions.rand(arm.armDist)
end

function tick!( arm::Bernoulli )
    # Do nothing
    nothing
end

function reset!( arm::Bernoulli )
    # Do nothing
    nothing
end


"""
    Normal( μ, σ )

Creates an arm with reward distributed as Normal random varaible with mean `μ`
and standard deviation `σ`.
"""
type Normal <: StationaryArmBase
    armDist::Distributions.Normal

    function Normal( μ::Real, σ::Real )
        new(
            Distributions.Normal( μ, σ )
        )
    end
end

function pull!( arm::Normal )
    return rand( arm.armDist )
end

function tick!( arm::Normal )
    # Do nothing
    nothing
end

function reset!( arm::Normal )
    # Do nothing
    nothing
end
