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
    
end

@testset "Square Arm" begin
    
end

@testset "Variational Arm" begin

end


end