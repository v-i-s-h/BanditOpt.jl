"""
    NonstationaryArmBase

`NonstationaryArmBase` is the concrete type for all nonstationary arm models. This
includes rested, restless and evolving arm models. Any subtype should implement
`pull!()`, `tick!()` and `reset!()` methods
"""
abstract type NonstationaryArmBase <: ArmBase end
