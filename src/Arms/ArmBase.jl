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
pull!( arm::ArmBase ) = nothing

"""
    tick!( arm::ArmBase )

Updates the underlying states of a non-stationary arm. This method is used to update
the state of arm if it is not the pulled arm. Not required for stationary arm models.
"""
tick!( arm::ArmBase ) = nothing

"""
    reset!( arm::ArmBase )

Resets the underlying state of the arm. Used usually in non-stationary arm models.
"""
reset!( arm::ArmBase ) = nothing
