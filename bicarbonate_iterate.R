ka1 = 4.3e-7
ka2 = 4.8e-11
kw = 1.0e-14
conc = 0.1

ph = seq(0,14,0.0001)
h = 10^-ph
oh = kw/h
carbonic = conc/(1 + ka1/h + ka1*ka2/h^2)
bicarb = ka1*carbonic/h
carb = ka2*bicarb/h

error = abs(h + conc - oh - bicarb - 2*carb)

id = which.min(error)

h[id]
oh[id]
carbonic[id]
bicarb[id]
carb[id]