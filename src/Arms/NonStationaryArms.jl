"""
    NonstationaryArmBase

`NonstationaryArmBase` is the concrete type for all nonstationary arm models. This
includes rested, restless and evolving arm models. Any subtype should implement
`pull!()`, `tick!()` and `reset!()` methods
"""
abstract type NonstationaryArmBase <: ArmBase end

"""
    Pulse( period, changePoint, holdDuration [,isRestless] )

`Pulse` creates a pulse reward arm which switches between 0 and 1. `period`(Int) is
the period of the pulse wave, `changePoint` (Int) is the point at which the pulse
should switch from 0 to 1 from the start of period. `holdDuration` (Int) is the time
for which the pulse should stay 1. `isRestless` (bool) sets whether the arm is
restless or not.
"""
mutable struct Pulse <: NonstationaryArmBase
    step::Int             # For tracking internally
    period::Int           # Period of the pulse
    changePoint::Int      # The point at which the signal goes high
    highDuration::Int     # Time to stay HIGH
    isRestless::Bool        # Is this a restless arm

    function Pulse( _period, _cp, _hd, _ir = true )
        new(
            0,
            _period,
            _cp,
            _hd,
            _ir
        )
    end
end

function pull!( arm::Pulse )
    arm.step    = arm.step + 1
    if arm.step > arm.period
        arm.step = 1
    end

    return ((arm.step>=arm.changePoint)&&(arm.step<=arm.changePoint+arm.highDuration))  ? 1 : 0;
end

function tick!( arm::Pulse )
    if arm.isRestless
        arm.step = arm.step + 1
        if arm.step > arm.period
            arm.step = 1
        end
    end
    nothing
end

function reset!( arm::Pulse )
    arm.step    = 0
    nothing
end

"""
    Sinusoidal( period[, isRestless = true [, offset = 2*π*rand()]] )

`Sinusoidal` creates an arm which sinusoidally changes between 0 and 1 with
`period`. `isRestless` (bool) sets whether the arm is restless or not. `offset`
sets the offset for the arm (set to a random offset by default).
"""
mutable struct Sinusoidal <: NonstationaryArmBase
    step::Int         # Time step
    period::Int       # Period of the sinusoidal wave
    isRestless::Bool    # Is this arm restless - True by default
    offset::Float64     # Initial pahse, random by default

    function Sinusoidal( p::Int; isRestless::Bool=true, offset::Float64=2*π*rand() )
        new(
            0,
            p,
            isRestless,
            offset
        )
    end
end

function pull!( arm::Sinusoidal )
    arm.step = arm.step + 1
    return 1/2 + 1/2 * sin( 2 * π * (arm.step-1)/arm.period + arm.offset )  # To limit rewards between 0 and 1
end

function tick!( arm::Sinusoidal )
    if arm.isRestless
        arm.step = arm.step + 1
    end
    nothing
end

function reset!( arm::Sinusoidal )
    arm.step = 0
    nothing
end


"""
    Square( period::Int, chnagePoints::Dict{Int,Float64}[,isRestless=true] )

`Square` creates an arm which switches value at specified instances. Starts from
a default value of `0` and changes to values as per the dictionary of changePoints.
```julia-repl
arm1 = Arms.Square( 50, Dict(10=>0.5,25=>0.20,40=>1.0) )
```
"""
mutable struct Square <: NonstationaryArmBase
    step::Int                         # For internal tracking
    period::Int                       # Period at which wave repeats
    changePoints::Dict{Int,Float64}   # Dictionary of change points
    isRestless::Bool                    # Is this a restless arm

    function Square( _period::Int, _cps::Dict{Int,Float64}, _ir::Bool = true )
        new(
            0,
            _period,
            _cps,
            _ir
        )
    end
end

function pull!( arm::Square )
    arm.step    = arm.step + 1
    if arm.step > arm.period
        arm.step = 1
    end
    lastCpIndex = 0.0;
    for timeIdx in keys(arm.changePoints)
        if timeIdx <= arm.step && timeIdx > lastCpIndex
            lastCpIndex = timeIdx
        end
    end
    if lastCpIndex == 0 # No change occured
        return 0.0
    else
        return arm.changePoints[lastCpIndex]
    end
end

function tick!( arm::Square )
    if arm.isRestless
        arm.step = arm.step + 1
        if arm.step > arm.period
            arm.step = 1
        end
    end
    nothing
end

function reset!( arm::Square )
    arm.step    = 0
    nothing
end

"""
    Variational( variation, period[, isRestless=true[,offset=2π*rand()]] )

`Variational` creates a nonstationary arm as mentioned in
    Besbes, O., Gur, Y., & Zeevi, A. (2014). Optimal Exploration-Exploitation in a Multi-Armed-Bandit Problem with Non-stationary Rewards, 1–20.
"""
mutable struct Variational <: NonstationaryArmBase
    step::Int64         # Time step
    variation::Float64  # Variation of the arms
    period::Float64     # Period of the sinusoidal wave
    isRestless::Bool    # Is this arm restless - True by default
    offset::Float64     # Initial phase, random by default

    function Variational( variation::Float64, period::Float64; isRestless::Bool=true, offset::Float64=2*π*rand() )
        new( 0, variation, period, isRestless, offset )
    end
end

function pull!( arm::Variational )
    arm.step = arm.step + 1
    return 1/2 + 1/2 * sin( arm.variation * π * (arm.step-1)/arm.period + arm.offset )  # To limit rewards between 0 and 1
end

function tick!( arm::Variational )
    if arm.isRestless
        arm.step = arm.step + 1
    end
    nothing
end

function reset!( arm::Variational )
    arm.step = 0
    nothing
end
