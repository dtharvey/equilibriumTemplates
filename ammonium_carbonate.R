# provide equilibrium constants for all reactions
Kw = 1.00e-14
kb = 1.8e-5 #kb for ammonia
ka1 = 4e-7 #ka1 for carbonic acid
ka2 = 5e-11 #ka2 for carbonic acid

# provide total concentration for all mass balances
c = 0.1

# set up master variable
pH = seq(1, 14, 0.001)

# calculate concentrations of all species in system
h3o = 10^-pH
oh = Kw/h3o
nh3 = (c*oh)/(kb + oh)
nh4 = c - nh3
h2co3 = c/(1 + (ka1/h3o) + (ka1*ka2/h3o^2))
hco3 = ka1*h2co3/h3o
co3 = ka2*hco3/h3o

# define error function using abolute value
error = abs(h3o + nh4 - hco3 - 2*co3 - oh)

# find the index for the minimum error (the error closest to zero)
id = which.min(error)
id

# report out all values
pH[id]
h3o[id]
oh[id]
nh3[id]
nh4[id]
h2co3[id]
hco3[id]
co3[id]
error[id]

# plot of error function (if of interest)
plot(pH, log10(error), type = "l", xlab = "pH", ylab = "error", lwd = 2, col = "blue")
abline(v = pH[id], lty = 2, col = "red", lwd = 2)

# plot of species concentrations
i = seq(1,length(pH), 100)
plot(x = pH[i], y = log10(h3o[i]), lwd = 2, type = "l", lty = 1, xlab = "pH", ylab = "log[ ]")
lines(x = pH[i], y = log10(oh[i]), lwd =2 , lty = 1)
lines(x = pH[i], y = log10(nh3[i]), lwd =2, col = "blue", lty = 1)
lines(x = pH[i], y = log10(nh4[i]), lwd =2 , col = "blue", lty = 2)
lines(x = pH[i], y = log10(h2co3[i]), lwd =2 , col = "green", lty = 1)
lines(x = pH[i], y = log10(hco3[i]), lwd =2 ,  col = "green", lty = 2)
lines(x = pH[i], y = log10(co3[i]), lwd =2 ,  col = "green", lty = 3)
abline(v = pH[id], lwd = 2, lty = 2, col = "red")
legend("bottomright", legend = c("h3o","oh","nh3", "nh4", "h2co3", "hco3", "co3", "pH"), lwd = 2, col = c("black", "black", "blue", "blue", "green", "green", "green", "red"), lty = c(1, 1, 1, 2, 1, 2, 3, 2), bg = "white", box.col = "white")

# alpha diagrams
i = seq(1,length(pH), 100)
plot(x = pH[i], y = nh3[i]/c, lwd = 2, col = "blue", type = "l", xlab = "pH", ylab = "alpha")
lines(x = pH[i], y = nh4[i]/c, lwd = 2, col = "blue", lty = 2)
lines(x = pH[i], y = h2co3[i]/c, lwd = 2, col = "green", lty = 1)
lines(x = pH[i], y = hco3[i]/c, lwd = 2, col = "green", lty = 2)
lines(x = pH[i], y = co3[i]/c, lwd = 2, col = "green", lty = 3)
abline(v = pH[id], lwd = 2, lty = 2, col = "red")
legend("bottomright", legend = c("nh3", "nh4", "h2co3", "hco3", "co3", "pH"), lwd = 2, col = c("blue", "blue", "green", "green", "green", "red"), lty = c(1, 2, 1, 2, 3, 2), bg = "white", box.col = "white")
