# provide equilibrium constants for all reactions
Kw = 1.00e-14
Ksp = 1.8e-10
K = c(5000, 83, 6.0, 0.50)

# provide total concentration for all mass balances
# NOTE: the mass balance equation does not include a known concentration

# set up master variable
pCl= seq(0, 14, 0.01)

# calculate concentrations of all species in system
Cl = 10^-pCl
Ag = Ksp/Cl
AgCl = K[1]*Ag*Cl
AgCl2 = K[2]*AgCl*Cl
AgCl3 = K[3]*AgCl2*Cl
AgCl4 = K[4]*AgCl3*Cl

# define error function using abolute value
error = abs(Ag - Cl - AgCl2 - 2*AgCl3 - 3*AgCl4)

# find the index for the minimum error (the error closest to zero)
id = which.min(error)
id

# report out all values
pCl[id]
Cl[id]
Ag[id]
AgCl[id]
AgCl2[id]
AgCl3[id]
AgCl4[id]
solubility = Ag[id] + AgCl[id] + AgCl2[id] + AgCl3[id] + AgCl4[id]
solubility


# plot of error function (if of interest)
plot(pCl, log10(error), type = "l", lwd = 2, col = "blue")
abline(v = pCl[id], lwd = 2, lty = 2, col = "red")

# exploring solubility as a function of pCl

# set up master variable
pCl= seq(0, 14, 0.01)

# calculate concentrations of all species in system
Cl = 10^-pCl
Ag = Ksp/Cl
AgCl = K[1]*Ag*Cl
AgCl2 = K[2]*AgCl*Cl
AgCl3 = K[3]*AgCl2*Cl
AgCl4 = K[4]*AgCl3*Cl

# substitute into equation for solubility
solubility = Ag + AgCl + AgCl2 + AgCl3 + AgCl4

# plot solubility vs. pCl
plot(pCl, solubility, type = "l")
plot(pCl, log10(solubility), type = "l")

# examine the more interesting parts of the solubility space
plot(pCl, log10(solubility), type = "l", xlim = c(8, 0), ylim = c(-10, 2), col ="blue", lwd = 2)
lines(pCl, log10(Ag), lty = 2, lwd = 2, col = "red")
lines(pCl, log10(AgCl), lty = 3, lwd = 2,col = "red")
lines(pCl, log10(AgCl2), lty = 4, lwd = 2,col = "red")
lines(pCl, log10(AgCl3), lty = 5, lwd = 2,col = "red")
lines(pCl, log10(AgCl4), lty = 6, lwd = 2,col = "red")
legend(x = "topleft",
       legend = c("solubility", "Ag", "AgCl", "AgCl2", "AgCl3", "AgCl4"),
       lty = c(1, 2, 3, 4, 5, 6), col = c("blue", rep("red", 5)), lwd = 2,
       bty = "n")
abline(v = pCl[id], lty = 1, col = "green", lwd = 2)
