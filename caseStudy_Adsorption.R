#######################################################
# Part I: Acid-Base Chemistry of Metal Oxide Surfaces #
#######################################################
#######################################################
#######################################################

# adding text explaining

# equilibrium constants
Ka1 = 1.00e-6
Ka2 = 2.00e-8
Kw = 1.00e-14

# mass balance on surface sites
Caloh = 1e-4

# set up master variable
ph = seq(0, 14, 0.01)

# calculate concentrations for surface sites
h = 10^-ph
oh = Kw/h
aloh2 = Caloh/(1 + Ka1/h + Ka1*Ka2/h^2)
aloh = Ka1*aloh2/h
alo = Ka1*Ka2*aloh2/h^2

# plot percentage of sites by type
plot(ph, 100*aloh2/Caloh, type = "l", lty = 2, lwd = 2, ylab = "percentage of sites", xlab = "pH")
lines(ph, 100*aloh/Caloh, lty = 3, lwd = 2)
lines(ph, 100*alo/Caloh, lty = 4, lwd = 2)
legend(x = "left", legend = c("AlOH2+", "AlOH", "AlO-"), lty = c(2, 3, 4), lwd = c(2, 2, 2), bty = "n")

####################################################
# Part II: Complexation of Lead With Surface Sites #
####################################################

# additional equilibrium constant
Kpb = 1.23e6

# additional mass balance
Cpb = 1e-7

# calculate additional concentrations
pb = Cpb/(1 + Kpb*alo)
alopb = Kpb*alo*pb

# plot percentages of lead absorbed and of surface sites
plot(ph, 100*alopb/Cpb, type = "l", lty = 1, lwd = 2, xlim = c(0, 14), ylab = "percentage Pb absorbed or of surface sites")
lines(ph, 100*aloh2/Caloh, col = "lightgray")
lines(ph, 100*aloh/Caloh, col = "lightgray")
lines(ph, 100*alo/Caloh, col = "lightgray")

#######################################################################
# Part III: How Does Concentration of Surface Sites Affect Absorption #
#######################################################################

# list of surface site concentrations
sd = c(1e-4, 3e-4, 5e-4, 7e-4, 1e-3)

for (i in 1:5) {
  Cpb = 1e-7
  ph = seq(0, 14, 0.01)
  h = 10^-ph
  oh = Kw/h
  Caloh = sd[i]
  aloh2 = Caloh/(1 + Ka1/h + Ka1*Ka2/h^2)
  aloh = Ka1*aloh2/h
  alo = Ka1*Ka2*aloh2/h^2
  pb = Cpb/(1 + Kpb*alo)
  alopb = Kpb*alo*pb
  if (i == 1) {
    plot(ph, 100*alopb/Cpb, type = "l", xlim = c(4,8), lwd = 2, ylab = "percentage of Pb absorbed or of surface sites", xlab = "pH")
  } else {
    lines(ph, 100*alopb/Cpb, lty = i, lwd = 2)
  }
  legend(x = "bottomright", legend = c("1e-4", "3e-4", "5e-4", "7e-4", "1e-3"), lty = c(1, 2, 3, 4, 5), lwd = 2, bty = "n")
  lines(ph, 100*aloh2/Caloh, col = "lightgray")
  lines(ph, 100*aloh/Caloh, col = "lightgray")
  lines(ph, 100*alo/Caloh, col = "lightgray")
}





