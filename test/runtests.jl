using BanditOpt
using Test
import InteractiveUtils: subtypes, which

macro test_nothrow(ex)
    quote
        try
            $(esc(ex))
            true
        catch e
            print( "ERROR: " )
            if isa( e, KeyError )
                println( "KeyError: key ", e.key, " not found" )
            else
                println( e )
            end
            false
        end
    end
end

tests = [
    # Agent specific tests
    "Agents/EpsGreedy",
    # Arm specific tests
    "Arms/StationaryArms",
    "Arms/NonStationaryArms"
    # Experiment specific tests
];


#=
Use
    ARGS = [ "sanity_check" ]; include( joinpath(Pkg.dir("BanditOpt"),"test","runtests.jl") )
or
    ARGS = [ "Algorithms/EpsGreedy" ]; include( joinpath(Pkg.dir("BanditOpt"),"test","runtests.jl") )
from REPL.
=#
if length(ARGS) > 0
    tests = ARGS
end

@testset "BanditOpt Tests" begin
for test_script in tests
    fp = joinpath( dirname(@__FILE__), "$(test_script).jl" )
    # println( "Testing : ", test_script )
    # @time include( fp )
    include( fp )
end
end

nothing
