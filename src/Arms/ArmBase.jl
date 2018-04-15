# Base Type for all arm model

"""
    ArmBase

`ArmBase` is the abtract type for all arm models in BanditOpt. It also defines the
default methods for interfacing with each of the arm models
"""
abstract type ArmBase end

"""
    pull!( arm::ArmBase )

Pulls an arm. Return the reward of the pull. If the arm is non-stationary, the 
underlying state of the arm is also updated.
"""
function pull!( arm::ArmBase )
    
end

"""
    tick!( arm::ArmBase )

Updates the underlying states of a non-stationary arm. This method is used to update
the state of arm if it is not the pulled arm. Not required for stationary arm models.
"""
function tick!( arm::ArmBase )

end

"""
    reset!( arm::ArmBase )

Resets the underlying state of the arm. Used usually in non-stationary arm models.
"""
function reset!( arm::ArmBase )

end

"""
    StationaryArm

`StationaryArm` is the concrete type for all the stationary arm models. Any
subtype should implement ```pull!()``` method
"""
abstract type StationaryArm end

function pull!( arm::StationaryArm )
    error( "No Implementation of pull!() for ", typeof(arm) )
end

""" 
    NonstationaryArm

`NonstationaryArm` is the concrete type for all nonstationary arm models. This 
includes rested, restless and evolving arm models. Any subtype should implement
```pull!()```, ```tick!()` and ```reset!()``` methods
"""
abstract type NonstationaryArm end

function pull!( arm::NonstationaryArm )
    error( "No Implementation of pull!() for ", typeof(arm) )
end

function tick!( arm::NonstationaryArm )
    error( "No Implementation of tick!() for ", typeof(arm) )
end

function reset!( arm::NonstationaryArm )
    error( "No Implementation of reset!() for ", typeof(arm) )
end
