# Base for implementing all algorithms
"""
    AgentBase

`AgentBase` is the base type for all MAB Algorithms

"""
abstract type AgentBase end

"""
    reset!( agent::AgentBase )

Resets the internal statistics of the bandit algorithm, except for the number of arms and other
algorithm specific parameters. `reset!()` will make `agent` as fresh as it was first created.
"""
reset!( agent::AgentBase ) = nothing

"""
    info_str( agent::AgentBase, latex::Bool = false )

Return a information string about the agent and it's parameters.  If flag `latex` is set to
`true`, then the returned string will be a compactable latex string.
"""
info_str( agent::AgentBase, latex::Bool = false ) = nothing

"""
    show( agent::AgentBase )

Prints information about agent into the specified I/O.
```julia-repl
```
"""
function Base.show( io::IO, ::MIME"text/plain", agent::AgentBase )
    print( io, @sprintf("Agent: %s",info_str(agent)) )
    for param in fieldnames(agent)
        print( @sprintf("\n    %-16s: ",param), getfield(agent,param) )
    end
end

# Functions to make instances of types
function call( ::Type{T}, params... ) where T <: AgentBase
    return T( params... )
end


"""
    make_agents_with_k( K::Int64, agent_list::Vector{} )

Returns a vector of agents specified in `agent_list` with `K` arms.
```julia-repl

```
"""
function make_agents_with_k( K::Int64, agent_list::Vector{} )
    agents = Vector{AgentBase}()
    for (agent,params) ∈ agent_list
        if params != nothing
            push!( agents, agent(K,params...) )
        else
            push!( agents, agent(K) )
        end
    end
    return agents
end

import Base: ==
"""
    ==

Can be used to compare two agents.
```julia-repl

```
"""
function ==( agent1::AgentBase, agent2::AgentBase )
    if typeof(agent1) != typeof(agent2)
        return false
    else
        for param in fieldnames(typeof(agent1))
            if getfield(agent1,param) != getfield(agent2,param)
                # info( "Failed at ", param )
                return false
            end
        end
        return true
    end
    false
end
