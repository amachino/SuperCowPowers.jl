using SuperCowPowers
using Test

@testset "SuperCowPowers.jl" begin
    @test_nowarn cowsay()
    @test_nowarn cowsay("a"^16)
    @test_nowarn cowsay("a"^32, type="borg")
    @test_nowarn cowsay("a"^64, type="dead")
    @test_nowarn cowsay("  ____\n / ___| ___ __      __ ___   __ _  _   _\n| |    / _ \\\\ \\ /\\ / // __| / _` || | | |\n| |___| (_) |\\ V  V / \\__ \\| (_| || |_| |\n \\____|\\___/  \\_/\\_/  |___/ \\__,_| \\__, |\n                                   |___/", wordwrap=false)
    @test_nowarn cowthink("🐄"^16, type="greedy")
    @test_nowarn cowthink("                     \\_/\n   m00h  (__)       -(_)-\n      \\  ~Oo~___     / \\\n         (..)  |\\\n___________|_|_|_____________", wordwrap=false)
    @test_nowarn moo()
    @test_nowarn moomoo()
    @test_nowarn moomoomoo()
end
