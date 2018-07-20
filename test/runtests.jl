using BanditOpt
using Test

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
    "Arms/StationaryArms"
    # Experiment specific tests
];


#=
Use
    ARGS = [ "sanity_check" ]; include( joinpath(Pkg.dir("MAB"),"test","runtests.jl") )
or
    ARGS = [ "Algorithms/epsGreedy" ]; include( joinpath(Pkg.dir("MAB"),"test","runtests.jl") )
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
