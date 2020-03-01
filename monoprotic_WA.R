# find the pH of monoprotic weak acid

# 1: provide equilibrium constants for all equilibrium reactions
Kw = 1.00e-14
Ka = 6.2e-10

# 2: provide total concentration for all mass balance equations
conc = 0.10

# 3: set up master variable
pH = seq(1, 14, 0.001)

# 4: calculate concentrations for all species in system using 
# equilibrium constants and mass balance equations
H3O = 10^-pH
OH = Kw/H3O
HA = conc/(1 + Ka/H3O)
A = conc - HA

# 5: define an error function using charge balance
error = abs(H3O - OH - A)

# 6: gather all results into data frame
df = data.frame(pH, error, H3O, OH, HA, A)

# 7: find index for the minimum error (error closest to zero)
id = which.min(df$error)
id

# 8: report out all values
df$pH[id]
df$H3O[id]
df$OH[id]
df$HA[id]
df$A[id]
df$error[id]

# 9: plot error function
plot(df$pH, log10(df$error), type = "l", xlab = "pH", 
     ylab = "log(error)", lwd = 2, col = "blue")
abline(v = df$pH[id], lty = 2, col = "red", lwd = 2)

# 10: plot distribution diagrams
matplot(x = df$pH, y = df[ , 5:6], type = "l", 
        xlab = "pH", ylab = "concentration")
matplot(x = df$pH, y = log10(df[ , 3:6]), type = "l", 
        xlab = "pH", ylab = "log(concentration)")
