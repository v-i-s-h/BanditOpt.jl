# Tests for Stationary Arm Model
using InteractiveUtils

@testset "Stationary Arm Models" begin

# Get list of stationary arm models
list_of_arms    = subtypes( Arms.StationaryArmBase )

# For each of them, check whether the basic interface is implemented
# In case of stationary arms, only pull has to be implemented
basefn__pull!   = which( Arms.pull!, Tuple{Arms.StationaryArmBase} )
basefn__tick!   = which( Arms.tick!, Tuple{Arms.StationaryArmBase} )
basefn_reset!   = which( Arms.reset!, Tuple{Arms.StationaryArmBase} )

@testset "Sanity Check" begin
    for arm_model ∈ list_of_arms
        @test basefn__pull! != which( Arms.pull!, Tuple{arm_model} )
        @test basefn__tick! == which( Arms.tick!, Tuple{arm_model} )
        @test basefn_reset! == which( Arms.reset!, Tuple{arm_model} )
    end
end

@testset "Bernoulli Arm" begin
    arm = Arms.Bernoulli( 0.3 )
    @test Arms.mean( arm )      == 0.3
    @test Arms.pull!( arm )     ∈ [0,1]
    @test Arms.tick!( arm )     == nothing
    @test Arms.reset!( arm )    == nothing
    @test Arms.mean( arm )      == 0.3           # Test after reseting
end

@testset "Beta Arm" begin
    arm = Arms.Beta( 2.0, 3.0 )
    @test Arms.mean( arm )      == 0.40
    @test 0.0 <= Arms.pull!( arm ) <= 1.0
    @test Arms.tick!( arm )     == nothing
    @test Arms.reset!( arm )    == nothing
    @test Arms.mean( arm )      == 0.40
end

@testset "Expoenential Arm" begin
    arm = Arms.Exponential( 2.0 )
    @test Arms.mean( arm )      == 2.0
    @test Arms.pull!( arm )     >= 0.0
    @test Arms.tick!( arm )     == nothing
    @test Arms.reset!( arm)     == nothing
    @test Arms.mean( arm )      == 2.0
end

@testset "Normal Arm" begin
    arm = Arms.Normal( 2.0, 1.0 )
    @test Arms.mean( arm )      == 2.0
    @test typeof( Arms.pull!(arm) ) <: Real
    @test Arms.tick!( arm )     == nothing
    @test Arms.reset!( arm )    == nothing
    @test Arms.mean( arm )      == 2.0
end

end
