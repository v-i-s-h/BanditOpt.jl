var documenterSearchIndex = {"docs": [

{
    "location": "#",
    "page": "Home",
    "title": "Home",
    "category": "page",
    "text": ""
},

{
    "location": "#BanditOpt.jl-1",
    "page": "Home",
    "title": "BanditOpt.jl",
    "category": "section",
    "text": "BanditOpt.jl is a julia package to make it easy to experiment with Multi-Armed Bandit problems."
},

{
    "location": "#Package-Features-1",
    "page": "Home",
    "title": "Package Features",
    "category": "section",
    "text": "This package implements popular MAB algorithms and arm models along with a clean API to easily prototype and evaluate new algorithms wit popular algorithms in literature. The library also aims at reproducible research and provides implementation for a wide set of bandit settings available in Bandit literature."
},

{
    "location": "#Manual-Outline-1",
    "page": "Home",
    "title": "Manual Outline",
    "category": "section",
    "text": ""
},

{
    "location": "start/#",
    "page": "Getting Started",
    "title": "Getting Started",
    "category": "page",
    "text": ""
},

{
    "location": "start/#Getting-Started-1",
    "page": "Getting Started",
    "title": "Getting Started",
    "category": "section",
    "text": ""
},

{
    "location": "start/#Installation-1",
    "page": "Getting Started",
    "title": "Installation",
    "category": "section",
    "text": "BanditOpt.jl is not yet a registered package. But you can to install it throughPkg.clone( \'https://github.com/v-i-s-h/BanditOpt.jl.git\' )"
},

{
    "location": "start/#Usage-1",
    "page": "Getting Started",
    "title": "Usage",
    "category": "section",
    "text": "To start using the package,using BanditOpt"
},

{
    "location": "start/#Accessing-documentation-from-REPL-1",
    "page": "Getting Started",
    "title": "Accessing documentation from REPL",
    "category": "section",
    "text": "The documentation for all the methods BanditOpt provides is also accessible via REPL. You can use the standard Julia way of searching (by typing ? followed by the function name) to get the documentation on REPL."
},

{
    "location": "concepts/#",
    "page": "Concepts",
    "title": "Concepts",
    "category": "page",
    "text": ""
},

{
    "location": "library/Agents/#",
    "page": "Agents",
    "title": "Agents",
    "category": "page",
    "text": ""
},

{
    "location": "library/Agents/#BanditOpt.Agents",
    "page": "Agents",
    "title": "BanditOpt.Agents",
    "category": "module",
    "text": "BanditOpt.Agents module provides implementations of various multi-arm bandit algorithms and an unified API to access those algorithms. This includes base types for implementing various types of agents and the common interface.\n\n\n\n"
},

{
    "location": "library/Agents/#Agents-1",
    "page": "Agents",
    "title": "Agents",
    "category": "section",
    "text": "This section discusses the common features of agents (algorithms) implemented in this packages.CurrentModule = BanditOptAgents"
},

{
    "location": "library/Agents/#BanditOpt.Agents.AgentBase",
    "page": "Agents",
    "title": "BanditOpt.Agents.AgentBase",
    "category": "type",
    "text": "AgentBase\n\nAgentBase is the base type for all MAB Algorithms\n\n\n\n"
},

{
    "location": "library/Agents/#AgentBase-1",
    "page": "Agents",
    "title": "AgentBase",
    "category": "section",
    "text": "AgentBase"
},

{
    "location": "library/Agents/#Common-Interface-1",
    "page": "Agents",
    "title": "Common Interface",
    "category": "section",
    "text": ""
},

{
    "location": "library/Agents/#BanditOpt.Agents.get_arm_index",
    "page": "Agents",
    "title": "BanditOpt.Agents.get_arm_index",
    "category": "function",
    "text": "get_arm_index( agent::AgentBase )\n\nGets the index of next arm to pull.\n\nExample\n\n\n\n\n\n"
},

{
    "location": "library/Agents/#get_arm_index()-1",
    "page": "Agents",
    "title": "get_arm_index()",
    "category": "section",
    "text": "get_arm_index"
},

{
    "location": "library/Agents/#BanditOpt.Agents.update_reward!",
    "page": "Agents",
    "title": "BanditOpt.Agents.update_reward!",
    "category": "function",
    "text": "update_reward!( agent::AgentBase, r::Real )\n\nUpdates the reward to bandit algorithm agent. r must a real number within valid range.\n\n\n\n"
},

{
    "location": "library/Agents/#update_reward!()-1",
    "page": "Agents",
    "title": "update_reward!()",
    "category": "section",
    "text": "update_reward!"
},

{
    "location": "library/Agents/#BanditOpt.Agents.reset!",
    "page": "Agents",
    "title": "BanditOpt.Agents.reset!",
    "category": "function",
    "text": "reset!( agent::AgentBase )\n\nResets the internal statistics of the bandit algorithm, except for the number of arms and other algorithm specific parameters. reset!() will make agent as fresh as it was first created.\n\n\n\n"
},

{
    "location": "library/Agents/#reset!()-1",
    "page": "Agents",
    "title": "reset!()",
    "category": "section",
    "text": "reset!"
},

{
    "location": "library/Agents/#BanditOpt.Agents.info_str",
    "page": "Agents",
    "title": "BanditOpt.Agents.info_str",
    "category": "function",
    "text": "info_str( agent::AgentBase, latex::Bool = false )\n\nReturn a information string about the agent and it\'s parameters.  If flag latex is set to true, then the returned string will be a compactable latex string.\n\n\n\n"
},

{
    "location": "library/Agents/#info_str()-1",
    "page": "Agents",
    "title": "info_str()",
    "category": "section",
    "text": "info_str"
},

{
    "location": "library/Agents/#-1",
    "page": "Agents",
    "title": "",
    "category": "section",
    "text": ""
},

{
    "location": "library/Agents/stationary/#",
    "page": "-",
    "title": "-",
    "category": "page",
    "text": ""
},

{
    "location": "library/Arms/#",
    "page": "-",
    "title": "-",
    "category": "page",
    "text": ""
},

{
    "location": "contributing/#",
    "page": "-",
    "title": "-",
    "category": "page",
    "text": ""
},

{
    "location": "ack/#",
    "page": "-",
    "title": "-",
    "category": "page",
    "text": ""
},

]}
