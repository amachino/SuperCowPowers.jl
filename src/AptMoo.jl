module AptMoo

export moo, moomoo, moomoomoo

function moo()
    print(raw"""
                 (__)
                 (oo)
           /------\/
          / |    ||
         *  /\---/\
            ~~   ~~
..."Have you mooed today?"...
""")
end

function moomoo()
    print(raw"""
                 (__)
         _______~(..)~
           ,----\(oo)
          /|____|,'
         * /"\ /\
           ~ ~ ~ ~
..."Have you mooed today?"...
""")
end

function moomoomoo()
    print(raw"""
                     \_/
   m00h  (__)       -(_)-
      \  ~Oo~___     / \
         (..)  |\
___________|_|_|_____________
..."Have you mooed today?"...
""")
end

end # module