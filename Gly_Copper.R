# Part I: Acid-Base Chemistry of Glycine

# equilibrium constants
Ka1 = 4.47e-3
Ka2 = 1.67e-10
Kw = 1.00e-14

# mass balance concentrations
Cgly = 0.010

# master variable
pH = seq(0, 14, 0.01)

# concentration of all species
H3O = 10^-pH
OH = Kw/H3O
G = Cgly/(H3O^2/(Ka1*Ka2) + H3O/Ka2 + 1)
HG = H3O*G/Ka2
H2G = H3O^2*G/(Ka1*Ka2)

# plot distribution diagram
plot(pH, H2G, type = "l", lty = 2, xlab = "pH", ylab = "concentration")
lines(pH, HG, lty = 3)
lines(pH, G, lty = 4)

# plot log distribution diagram
plot(pH, log10(H2G), type = "l", lty = 2, xlab = "pH", ylab = "log(concentration)")
lines(pH, log10(HG), lty = 3)
lines(pH, log10(G), lty = 4)

# Part II: Copper and Glycine Complexation

# new equilibrium constants
K1 = 4.17e8
K2 = 9.33e6

# additional mass balance concentrations
# Cgly = 1.00e-2
Ccu = 1.00e-4


# concentration of new species
Cu = Ccu/(1 + K1*G + K1*K2*G^2)
CuG = K1*Cu*G
CuG2 = K2*CuG*G

# plot log distribution diagram
plot(pH, log10(H2G), type = "l", lty = 1, xlab = "pH", ylab = "log(concentration)", col = "lightgray")
lines(pH, log10(HG), lty = 1, col = "lightgray")
lines(pH, log10(G), lty = 1, col = "lightgray")
lines(pH, log10(Cu), lty = 2, lwd = 2)
lines(pH, log10(CuG), lty = 3, lwd = 2)
lines(pH, log10(CuG2), lty = 4, lwd = 2)


# Part III: Complexation of Cu and OH

# new equilibrium constants
K1.oh = 3.98e6

# new concentrations for copper species
Cu = Ccu/(1 + K1*G + K1*K2*G^2 + K1.oh*OH)
CuG = K1*Cu*G
CuG2 = K2*CuG*G
CuOH = K1.oh*Cu*OH

# plot results
plot(pH, log10(H2G), type = "l", lty = 1, xlab = "pH", ylab = "log(concentration)", col = "lightgray")
lines(pH, log10(HG), lty = 1, col = "lightgray")
lines(pH, log10(G), lty = 1, col = "lightgray")
lines(pH, log10(Cu), lty = 2, lwd = 2)
lines(pH, log10(CuG), lty = 3, lwd = 2)
lines(pH, log10(CuG2), lty = 4, lwd = 2)
lines(pH, log10(CuOH), lty = 5, lwd = 2)

# Part IV: Precipitation of Cu(OH)2

# new equilibrium constant
Ksp = 4.79e-20

# use error function to find [Cu] where ppt occurs
error = abs(Ksp - Cu*OH^2)
id = which.min(error)
pH[id]

# add precipitation threshold to plot
abline(v = pH[id], lwd = 3)
