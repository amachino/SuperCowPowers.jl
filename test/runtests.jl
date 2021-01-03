using SuperCowPowers
using Test

@testset "SuperCowPowers.jl" begin
    @test_nowarn cowsay()
    @test_nowarn cowsay("a"^16)
    @test_nowarn cowsay("a"^32)
    @test_nowarn cowsay("a"^64)
    @test_nowarn cowsay("あ"^16)
    @test_nowarn cowsay("あ"^32)
    @test_nowarn cowsay("あ"^64)
    @test_nowarn cowsay("🐄"^16, type="borg")
    @test_nowarn cowsay("🐄"^16, type="dead")
    @test_nowarn cowthink()
    @test_nowarn cowthink("a"^16)
    @test_nowarn cowthink("a"^32)
    @test_nowarn cowthink("a"^64)
    @test_nowarn cowthink("あ"^16)
    @test_nowarn cowthink("あ"^32)
    @test_nowarn cowthink("あ"^64)
    @test_nowarn cowthink("🐄"^16, type="borg")
    @test_nowarn cowthink("🐄"^16, type="dead")
    @test_nowarn moo()
    @test_nowarn moomoo()
    @test_nowarn moomoomoo()
end
