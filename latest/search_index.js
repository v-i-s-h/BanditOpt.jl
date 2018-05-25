var documenterSearchIndex = {"docs": [

{
    "location": "#",
    "page": "Home",
    "title": "Home",
    "category": "page",
    "text": ""
},

{
    "location": "#BanditOpt",
    "page": "Home",
    "title": "BanditOpt",
    "category": "module",
    "text": "BanditOpt is a Julia package for experimenting with various Multi-Armed Bandit algorithms.\n\n\n\n"
},

{
    "location": "#BanditOpt.jl-1",
    "page": "Home",
    "title": "BanditOpt.jl",
    "category": "section",
    "text": "BanditOpt.jl is a julia package to make it easy to experiment with Multi-Armed Bandit problems.BanditOpt"
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
    "text": "This section discusses the common features of agents (algorithms) implemented in this packages.CurrentModule = BanditOpt.AgentsAgents"
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
    "location": "library/Agents/#Base.show",
    "page": "Agents",
    "title": "Base.show",
    "category": "function",
    "text": "show( agent::AgentBase )\n\nPrints information about agent into the specified I/O.\n\n\n\n\n\n"
},

{
    "location": "library/Agents/#Base.:==",
    "page": "Agents",
    "title": "Base.:==",
    "category": "function",
    "text": "==\n\nCan be used to compare two agents.\n\n\n\n\n\n"
},

{
    "location": "library/Agents/#BanditOpt.Agents.make_agents_with_k",
    "page": "Agents",
    "title": "BanditOpt.Agents.make_agents_with_k",
    "category": "function",
    "text": "make_agents_with_k( K::Int64, agent_list::Vector{} )\n\nReturns a vector of agents specified in agent_list with K arms.\n\n\n\n\n\n"
},

{
    "location": "library/Agents/#Methods-1",
    "page": "Agents",
    "title": "Methods",
    "category": "section",
    "text": "show==make_agents_with_k"
},

{
    "location": "library/Agents/#BanditOpt.Agents.StationaryAgentBase",
    "page": "Agents",
    "title": "BanditOpt.Agents.StationaryAgentBase",
    "category": "type",
    "text": "StationaryAgentBase\n\nStationaryAgentBase is the base type for all agents designed to handle stationary arms. Even though it is not enforced, the assumption is the reward updated to stationary agents are from a stationary arm model.\n\n\n\n"
},

{
    "location": "library/Agents/#StationaryAgentBase-1",
    "page": "Agents",
    "title": "StationaryAgentBase",
    "category": "section",
    "text": "StationaryAgentBase"
},

{
    "location": "library/Agents/#Functions-1",
    "page": "Agents",
    "title": "Functions",
    "category": "section",
    "text": ""
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
    "location": "library/Agents/#BanditOpt.Agents.get_arm_index",
    "page": "Agents",
    "title": "BanditOpt.Agents.get_arm_index",
    "category": "function",
    "text": "get_arm_index( agent::StationaryAgentBase )\n\nGets the index of next arm to pull.\n\nExample\n\n\n\n\n\n"
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
    "text": "update_reward!( agent::StationaryAgentBase, r::Real )\n\nUpdates the reward to bandit algorithm agent. r must a real number within valid range.\n\n\n\n"
},

{
    "location": "library/Agents/#update_reward!()-1",
    "page": "Agents",
    "title": "update_reward!()",
    "category": "section",
    "text": "update_reward!"
},

{
    "location": "library/Agents/#NonStationaryAgentBase-1",
    "page": "Agents",
    "title": "NonStationaryAgentBase",
    "category": "section",
    "text": "_TODO_"
},

{
    "location": "library/Agents/stationary/#",
    "page": "Stationary Bandit Agents",
    "title": "Stationary Bandit Agents",
    "category": "page",
    "text": ""
},

{
    "location": "library/Agents/stationary/#Stationary-Bandit-Agents-1",
    "page": "Stationary Bandit Agents",
    "title": "Stationary Bandit Agents",
    "category": "section",
    "text": "This page lists stationary bandit agents available in the package."
},

{
    "location": "library/Agents/stationary/#BanditOpt.Agents.epsGreedy",
    "page": "Stationary Bandit Agents",
    "title": "BanditOpt.Agents.epsGreedy",
    "category": "type",
    "text": "epsGreedy( noOfArms, ϵ )\n\nImplements constant exploration ϵ-greedy agent. noOfArms is the number of arms to pick from and ϵ is the exploration factor.\n\n\n\n"
},

{
    "location": "library/Agents/stationary/#ϵ-Greedy-Agent-1",
    "page": "Stationary Bandit Agents",
    "title": "ϵ-Greedy Agent",
    "category": "section",
    "text": "epsGreedy"
},

{
    "location": "library/Agents/stationary/#BanditOpt.Agents.epsNGreedy",
    "page": "Stationary Bandit Agents",
    "title": "BanditOpt.Agents.epsNGreedy",
    "category": "type",
    "text": "epsNGreedy( noOfArms, c , d )\n\nImplementats decaying exploration factor ϵ-greedy agent. noOfArms is the number of of options, c and d are algorithm dependent parameters.\n\nReference: Auer, P., Bianchi, N. C., & Fischer, P. (2002). Finite time analysis of the multiarmed bandit problem. Machine Learning, 47, 235–256.\n\n\n\n"
},

{
    "location": "library/Agents/stationary/#ϵₙ-Greedy-Agent-1",
    "page": "Stationary Bandit Agents",
    "title": "ϵₙ-Greedy Agent",
    "category": "section",
    "text": "epsNGreedy"
},

{
    "location": "library/Agents/nonstationary/#",
    "page": "Nonstationary Bandit  Agents",
    "title": "Nonstationary Bandit  Agents",
    "category": "page",
    "text": ""
},

{
    "location": "library/Agents/nonstationary/#Nonstationary-Bandit-Agents-1",
    "page": "Nonstationary Bandit  Agents",
    "title": "Nonstationary Bandit  Agents",
    "category": "section",
    "text": "This page lists stationary bandit agents available in the package._Under Construction_"
},

{
    "location": "library/Arms/#",
    "page": "Arms",
    "title": "Arms",
    "category": "page",
    "text": ""
},

{
    "location": "library/Arms/#BanditOpt.Arms",
    "page": "Arms",
    "title": "BanditOpt.Arms",
    "category": "module",
    "text": "ArmModels\n\nArmModels module includes the different types of reward processes available for Bandit algorithms. It define the following base types for creating new reward processes.\n\nArms.ArmBase\nArms.StationaryArmBase\nArms.NonstationaryArmBase\n\n\n\n"
},

{
    "location": "library/Arms/#Arms-1",
    "page": "Arms",
    "title": "Arms",
    "category": "section",
    "text": "This section discusses the arm models implemented in this packages.CurrentModule = BanditOpt.ArmsArms"
},

{
    "location": "library/Arms/#BanditOpt.Arms.ArmBase",
    "page": "Arms",
    "title": "BanditOpt.Arms.ArmBase",
    "category": "type",
    "text": "ArmBase\n\nArmBase is the abtract type for all arm models in BanditOpt. It also defines the default methods for interfacing with each of the arm models\n\n\n\n"
},

{
    "location": "library/Arms/#Arms.ArmBase-1",
    "page": "Arms",
    "title": "Arms.ArmBase",
    "category": "section",
    "text": "ArmBase"
},

{
    "location": "library/Arms/#Functions-1",
    "page": "Arms",
    "title": "Functions",
    "category": "section",
    "text": ""
},

{
    "location": "library/Arms/#BanditOpt.Arms.pull!",
    "page": "Arms",
    "title": "BanditOpt.Arms.pull!",
    "category": "function",
    "text": "pull!( arm::ArmBase )\n\nPulls an arm. Return the reward of the pull. If the arm is non-stationary, the underlying state of the arm is also updated.\n\n\n\n"
},

{
    "location": "library/Arms/#Arms.pull!()-1",
    "page": "Arms",
    "title": "Arms.pull!()",
    "category": "section",
    "text": "pull!"
},

{
    "location": "library/Arms/#BanditOpt.Arms.tick!",
    "page": "Arms",
    "title": "BanditOpt.Arms.tick!",
    "category": "function",
    "text": "tick!( arm::ArmBase )\n\nUpdates the underlying states of a non-stationary arm. This method is used to update the state of arm if it is not the pulled arm. Not required for stationary arm models.\n\n\n\n"
},

{
    "location": "library/Arms/#Arms.tick!()-1",
    "page": "Arms",
    "title": "Arms.tick!()",
    "category": "section",
    "text": "tick!"
},

{
    "location": "library/Arms/#BanditOpt.Arms.reset!",
    "page": "Arms",
    "title": "BanditOpt.Arms.reset!",
    "category": "function",
    "text": "reset!( arm::ArmBase )\n\nResets the underlying state of the arm. Used usually in non-stationary arm models.\n\n\n\n"
},

{
    "location": "library/Arms/#Arms.reset!()-1",
    "page": "Arms",
    "title": "Arms.reset!()",
    "category": "section",
    "text": "reset!"
},

{
    "location": "library/Arms/#BanditOpt.Arms.StationaryArmBase",
    "page": "Arms",
    "title": "BanditOpt.Arms.StationaryArmBase",
    "category": "type",
    "text": "StationaryArmBase\n\nStationaryArmBase is the concrete type for all the stationary arm models. Any subtype should implement pull!() method\n\n\n\n"
},

{
    "location": "library/Arms/#Arms.StationaryArmBase-1",
    "page": "Arms",
    "title": "Arms.StationaryArmBase",
    "category": "section",
    "text": "StationaryArmBase"
},

{
    "location": "library/Arms/#BanditOpt.Arms.NonstationaryArmBase",
    "page": "Arms",
    "title": "BanditOpt.Arms.NonstationaryArmBase",
    "category": "type",
    "text": "NonstationaryArmBase\n\nNonstationaryArmBase is the concrete type for all nonstationary arm models. This includes rested, restless and evolving arm models. Any subtype should implement pull!(), tick!() and reset!() methods\n\n\n\n"
},

{
    "location": "library/Arms/#Arms.NonstationaryArmBase-1",
    "page": "Arms",
    "title": "Arms.NonstationaryArmBase",
    "category": "section",
    "text": "NonstationaryArmBase"
},

{
    "location": "library/Arms/stationary/#",
    "page": "Stationary Arm Models",
    "title": "Stationary Arm Models",
    "category": "page",
    "text": ""
},

{
    "location": "library/Arms/stationary/#Stationary-Arm-Models-1",
    "page": "Stationary Arm Models",
    "title": "Stationary Arm Models",
    "category": "section",
    "text": "This section discusses the stationary arm models available in package."
},

{
    "location": "library/Arms/stationary/#BanditOpt.Arms.Bernoulli",
    "page": "Stationary Arm Models",
    "title": "BanditOpt.Arms.Bernoulli",
    "category": "type",
    "text": "Bernoulli( p )\n\nBernoulli creates a Bernoulli arm with success probability p.\n\n\n\n"
},

{
    "location": "library/Arms/stationary/#Bernoulli-Arm-1",
    "page": "Stationary Arm Models",
    "title": "Bernoulli Arm",
    "category": "section",
    "text": "Arms.Bernoulli"
},

{
    "location": "library/Arms/stationary/#BanditOpt.Arms.Normal",
    "page": "Stationary Arm Models",
    "title": "BanditOpt.Arms.Normal",
    "category": "type",
    "text": "Normal( μ, σ )\n\nCreates an arm with reward distributed as Normal random varaible with mean μ and standard deviation σ.\n\n\n\n"
},

{
    "location": "library/Arms/stationary/#Normal-Arm-(Gaussian-Arm)-1",
    "page": "Stationary Arm Models",
    "title": "Normal Arm (Gaussian Arm)",
    "category": "section",
    "text": "Arms.Normal"
},

{
    "location": "library/Arms/nonstationary/#",
    "page": "Non-stationary Arm Models",
    "title": "Non-stationary Arm Models",
    "category": "page",
    "text": ""
},

{
    "location": "library/Arms/nonstationary/#Non-stationary-Arm-Models-1",
    "page": "Non-stationary Arm Models",
    "title": "Non-stationary Arm Models",
    "category": "section",
    "text": "This section discusses the non-stationary arm models available in package."
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
