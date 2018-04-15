module BanditOpt

"""
BanditOpt is a Julia package for experimenting with various Multi-Armed Bandit algorithms.
"""
BanditOpt

module Agents
    using Distributions
    include( "Agents/AgentBase.jl" )
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
module ArmModels
    using Distributions
    include( "Arms/ArmBase.jl" )
end

end # module
