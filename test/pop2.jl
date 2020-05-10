using DynamicPolynomials
include("../src/POP.jl")
#using POP

X = @polyvar x y

o1 = x^2*y^2+x^4-y^3
o2 = x*y

g1  = x^2 + Float64(pi)*y^2 -2
g2 = x

h1 = 2*y^2-y
h2 = x^2+y*2.1*x*y

F  = POP.mom([([o1,o2],"inf"), ([g1,0],">=0"),([0,g2],">=0"), ([h1, h2],[1.,"=0"]) ], X)

POP.json(F)
POP.save("tmp.json",F)
G  = POP.readfile("tmp.json")
POP.json(G)
