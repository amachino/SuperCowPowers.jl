module SuperCowPowers

export cowsay, cowthink
export moo, moomoo, moomoomoo

include("Cowsay.jl")
using .Cowsay: cowsay, cowthink

include("AptMoo.jl")
using .AptMoo: moo, moomoo, moomoomoo

end # module