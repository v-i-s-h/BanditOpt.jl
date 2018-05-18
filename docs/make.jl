using Documenter, BanditOpt

makedocs(
    modules = [ BanditOpt ],
    doctest = true,
    format = :html,
    sitename = "BanditOpt.jl",
    authors = "Vishnu Raj",
    linkcheck = false,
    pages = [
        "Home" => "index.md",
        "Getting Started" => "start.md",
        "Concepts" => "concepts.md",
        "Library" => Any[
            "Agents" => Any[
                "library/Agents/index.md",
                "library/Agents/stationary.md"
            ],
            "Arms" => Any[
                "library/Arms/index.md"
            ]
        ],
        "Manual" => Any[
            "contributing.md",
            "ack.md"
        ]
    ],
    # Use clean URLs, unless built as a "local" build
    html_prettyurls = !("local" in ARGS),
)

deploydocs(
    repo    = "github.com/v-i-s-h/BanditOpt.jl.git",
    target  = "build",
    osname  = "linux",
    julia   = "release",
    deps    = nothing,
    make    = nothing
)
