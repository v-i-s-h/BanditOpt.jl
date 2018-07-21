# Tests for Non-stationary arm models

@testset "Non-stationary Arm Models" begin
    
# Get list of Non-stationary arms
list_of_arms    = subtypes( Arms.NonstationaryArmBase )

# For each of them, check the basic functions are implemented. For 
# NonStationaryArms, pull!(), tick!() and reset!() must be implemented
basefn__pull!   = which( Arms.pull!, Tuple{Arms.NonstationaryArmBase} )
basefn__tick!   = which( Arms.tick!, Tuple{Arms.NonstationaryArmBase} )
basefn__reset!  = which( Arms.reset!, Tuple{Arms.NonstationaryArmBase} )

@testset "Sanity check" begin
    for arm_model ∈ list_of_arms
        @test basefn__pull! != which( Arms.pull!, Tuple{arm_model} )
        @test basefn__tick! != which( Arms.tick!, Tuple{arm_model} )
        @test basefn__reset! != which( Arms.reset!, Tuple{arm_model} )
    end
end

@testset "Pulse Arm" begin
    # ----------------------------- Test Restless ------------------------------------------
    arm = Arms.Pulse( 10, 3, 5 )
    # First 2 pulls should return 0
    @test all( [Arms.pull!(arm) for i = 1:2] .== 0 )
    # Next 5 should be 1
    @test all( [Arms.pull!(arm) for i = 1:5] .== 1 )
    # Next should 3 be 0
    @test all( [Arms.pull!(arm) for i = 1:3] .== 0 )
    # Start of next period
    for i = 1:2 # Do two ticks -- this is restless arm; 
        Arms.tick!( arm )
    end
    # Now next 5 should be 1
    @test all( [Arms.pull!(arm) for i = 1:5] .== 1 )
    # Next should 3 be 0
    @test all( [Arms.pull!(arm) for i = 1:3] .== 0 )
    # Advance 5 timesteps before reset
    for i = 1:5; Arms.pull!( arm ); end
    # Do reset and repeat
    Arms.reset!( arm )
    # First 2 pulls should return 0
    @test all( [Arms.pull!(arm) for i = 1:2] .== 0 )
    # Next 5 should be 1
    @test all( [Arms.pull!(arm) for i = 1:5] .== 1 )
    # Next should 3 be 0
    @test all( [Arms.pull!(arm) for i = 1:3] .== 0 )

    # ------------------------------ Test Rested -------------------------------------------
    arm = Arms.Pulse( 10, 3, 5, false )
    # Do a few ticks
    for i = 1:6; Arms.tick!(arm); end
    @test all( [Arms.pull!(arm) for i = 1:2] .== 0 )
    # Next 5 should be 1
    @test all( [Arms.pull!(arm) for i = 1:5] .== 1 )
    # Next should 3 be 0
    @test all( [Arms.pull!(arm) for i = 1:3] .== 0 )
    
end

@testset "Sinusoidal Arm" begin
    # ----------------------------- Test Restless ------------------------------------------
    arm = Arms.Sinusoidal( 22 ) # Should start with some random offset and restless
    # Get first sample
    sample1 = Arms.pull!( arm )
    # Take 21 steps
    for i = 1:21; Arms.pull!( arm ); end
    sample2 = Arms.pull!( arm )
    # Both samples should match
    @test sample1 ≈ sample2
    # Take some more steps
    for i = 1:10; Arms.pull!( arm ); end
    # Reset
    Arms.reset!( arm )
    # Take new sample and check against the first sample; They should match
    @test Arms.pull!(arm) ≈ sample1

    # ----------------------------- Test Rested case ---------------------------------------
    arm = Arms.Sinusoidal( 22, isRestless = false )
    sample1 = Arms.pull!( arm )
    # Take 21 ticks, the samples should not match
    for i = 1:21; Arms.tick!( arm ); end
    @test Arms.pull!(arm) ≉ sample1
    # Now pull 20 time
    for i = 1:20; Arms.pull!( arm ); end
    @test Arms.pull!(arm) ≈ sample1
    
end

@testset "Square Arm" begin
    # ---------------------------- Test Restless -------------------------------------------
    arm = Arms.Square( 15, Dict(3=>0.10,7=>0.75,12=>0.30) )
    # First 2 should be 0
    @test all( [Arms.pull!(arm) for i = 1:2] .== 0 )
    # Next 4 should be 0.10 (3-6)
    @test all( [Arms.pull!(arm) for i = 1:4] .== 0.10 )
    # Next 5 should be 0.75 (7-11)
    @test all( [Arms.pull!(arm) for i = 1:5] .== 0.75 )
    # Next 4 should be 0.30 (12-15)
    @test all( [Arms.pull!(arm) for i = 1:4] .== 0.30 )
    # Now, period is over, it should return to 0
    @test Arms.pull!(arm) == 0.0
    # Take random steps reset
    for i = 1:4; Arms.pull!(arm); end
    Arms.reset!( arm )
    @test Arms.pull!(arm) == 0.0

    # Test start points
    arm = Arms.Square( 15, Dict(1=>0.33) )
    @test Arms.pull!(arm) == 0.33
    # --------------------------- Test Rested ----------------------------------------------
    arm = Arms.Square( 15, Dict(3=>0.10,7=>0.75,12=>0.30), false )
    @test all( [Arms.pull!(arm) for i = 1:2] .== 0 )
    @test all( [Arms.pull!(arm) for i = 1:2] .== 0.10 )
    for i = 1:5; Arms.tick!(arm); end
    @test all( [Arms.pull!(arm) for i = 1:2] .== 0.10 )
    @test all( [Arms.pull!(arm) for i = 1:5] .== 0.75 )

end

# @testset "Variational Arm" begin
#     arm = Arms.Variational( 5, 10 )
#     rewards = [ Arms.pull!(arm) for i = 1:5 ]
#     # Calculate variation
#     variation = sum( abs.(rewards[1:end-1]-rewards[2:end]) )
#     @test variation ≈ 10.0
# end


end