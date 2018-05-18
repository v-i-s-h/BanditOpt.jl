module BanditOpt

"""
BanditOpt is a Julia package for experimenting with various Multi-Armed Bandit algorithms.
"""
BanditOpt


"""
BanditOpt.Agents module provides implementations of various multi-arm bandit algorithms and an
unified API to access those algorithms. This includes base types for implementing various types
of agents and the common interface.
"""
module Agents
    using Distributions
    using LaTeXStrings
    include( "Agents/AgentBase.jl" )

    export
        # Methods
        get_arm_index, update_reward!, reset!, info_str,
        show,
        # Agents
        AgentBase
end

"""
    ArmModels

`ArmModels` module includes the different types of reward processes available for
Bandit algorithms. It define the following base types for creating new reward
processes.
- [ArmBase](@ref)
- [StationaryArm](@ref)
- [NonstationaryArm](@ref)

"""
module Arms
    using Distributions
    include( "Arms/ArmBase.jl" )
end

# -----------------------------  Exports ----------------------------------
using .Agents
using .Arms

export
    # Agents Module
    Agents,
        # Methods
        get_arm_index, update_reward!, reset!, info_str, show,
        # Agents
        AgentBase,
    # Arms Modules
    Arms
        # Methods
        # Arm Models


end # module
