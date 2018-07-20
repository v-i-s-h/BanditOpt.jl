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
    using Printf
    include( "Agents/AgentBase.jl" )
    include( "Agents/StationaryAgentBase.jl" )

    export
        # Methods
        get_arm_index, update_reward!, reset!, info_str,
        show,
        # Agents
        AgentBase,
        # Stationary Agents
        StationaryAgentBase,
        epsGreedy, epsNGreedy
end

"""
    Arms

`Arms` module includes the different types of reward processes available for
Bandit algorithms. It define the following base types for creating new reward
processes.
- [Arms.ArmBase](@ref)
- [Arms.StationaryArmBase](@ref)
- [Arms.NonstationaryArmBase](@ref)
The types and methods in `Arms` are not exported and need to be called e.g as
`Arms.pull!()`
"""
module Arms
    using Distributions
    include( "Arms/ArmBase.jl" )
    include( "Arms/StationaryArms.jl" )
    include( "Arms/NonStationaryArms.jl" )

    # export
    #     # Methods
    #     pull!, tick!, reset!,
    #     # Arm Models
    #     ArmBase,
    #     # Stationary Arm Models
    #     StationaryArmBase,
    #     # Non-stationary Arm Models
    #     NonstationaryArmBase
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
        # Stationary Agents
        StationaryAgentBase,
        epsGreedy, epsNGreedy,
    # Arms Module
    Arms
        # # Methods
        # pull!, tick!, reset!,
        # # Arm Models
        # ArmBase,
        # # Stationary Arm Models
        # StationaryArmBase,
        # # Non Staionary Arm Models
        # NonstationaryArmBase

end # module
