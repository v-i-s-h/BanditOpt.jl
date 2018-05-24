# Agents
This section discusses the common features of agents (algorithms) implemented in
this packages.
```@meta
CurrentModule = BanditOpt
```

```@docs
Agents
```

## `AgentBase`
```@docs
AgentBase
```
### Methods
```@docs
show
```
```@docs
==
```
```@docs
Agents.make_agents_with_k
```

## `StationaryAgentBase`
```@docs
StationaryAgentBase
```
### Functions
#### `reset!()`
```@docs
Agents.reset!
```
#### `info_str()`
```@docs
Agents.info_str
```
#### `get_arm_index()`
```@docs
Agents.get_arm_index
```
#### `update_reward!()`
```@docs
Agents.update_reward!
```

## NonStationaryAgentBase
