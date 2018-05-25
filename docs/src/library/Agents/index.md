# Agents
This section discusses the common features of agents (algorithms) implemented in
this packages.
```@meta
CurrentModule = BanditOpt.Agents
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
make_agents_with_k
```

## `StationaryAgentBase`
```@docs
StationaryAgentBase
```
### Functions
#### `reset!()`
```@docs
reset!
```
#### `info_str()`
```@docs
info_str
```
#### `get_arm_index()`
```@docs
get_arm_index
```
#### `update_reward!()`
```@docs
update_reward!
```

## `NonStationaryAgentBase`
_TODO_
