# This file defines staionary arm models

"""
    StationaryArmBase

`StationaryArmBase` is the concrete type for all the stationary arm models. Any
subtype should implement ```pull!()``` method
"""
abstract type StationaryArmBase <: ArmBase end

# Default method for interface
pull!( arm::StationaryArmBase )     = nothing
tick!( arm::StationaryArmBase )     = nothing
reset!( arm::StationaryArmBase )    = nothing
mean( arm::StationaryArmBase )      = Distributions.mean( arm.armDist )

"""
    Bernoulli( p )
`Bernoulli` creates a Bernoulli arm with success probability `p`.
"""
mutable struct Bernoulli <: StationaryArmBase
    armDist::Distributions.Bernoulli

    function Bernoulli( p::Real )
        new( Distributions.Bernoulli(p) )
    end
end

function pull!( arm::Bernoulli )
    return Distributions.rand(arm.armDist)
end


"""
    Beta( α, β )

`Beta` creates a Beta arm with parameters `α` and `β`.
"""
mutable struct Beta <: StationaryArmBase
    armDist::Distributions.Beta

    function Beta( α::Real, β::Real )
        new( Distributions.Beta( α, β ) )
    end
end

function pull!( arm::Beta )
    return Distributions.rand( arm.armDist )
end


"""
    Exponetial( θ )

`Expoenential` creates a Expoenentially distributed arm with mean reward `θ`
"""
mutable struct Exponential <: StationaryArmBase
    armDist::Distributions.Exponential

    function Exponential( λ::Real ) # λ is the mean parameter
        new( Distributions.Exponential(λ) )
    end
end

function pull!( arm::Exponential )
    return Distributions.rand( arm.armDist )
end


"""
    Normal( μ, σ )

Creates an arm with reward distributed as Normal random varaible with mean `μ`
and standard deviation `σ`.
"""
mutable struct Normal <: StationaryArmBase
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
