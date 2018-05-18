# Base for all Stationary Agents
"""
    StationaryAgentBase

`StationaryAgentBase` is the base type for all agents designed to handle stationary
arms. Even though it is not enforced, the assumption is the reward updated to
stationary agents are from a stationary arm model.
"""

abstract type StationaryAgentBase end
