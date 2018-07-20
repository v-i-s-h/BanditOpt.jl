# Base for all Stationary Agents
"""
    StationaryAgentBase

`StationaryAgentBase` is the base type for all agents designed to handle stationary
arms. Even though it is not enforced, the assumption is the reward updated to
stationary agents are from a stationary arm model.
"""
abstract type StationaryAgentBase <: AgentBase end

"""
    get_arm_index( agent::StationaryAgentBase )

Gets the index of next arm to pull.

## Example
```julia-repl

```
"""
get_arm_index( agent::StationaryAgentBase ) = nothing

"""
    update_reward!( agent::StationaryAgentBase, r::Real )

Updates the reward to bandit algorithm `agent`. `r` must a real number within valid range.
"""
update_reward!( agent::StationaryAgentBase, r::Real ) = nothing

include( "EpsilonGreedy.jl" )
