# find the pH of diprotic system (H2A, HA, A)

# 1: provide equilibrium constants for all equilibrium reactions
Kw = 1.00e-14
Ka1 = 4.3e-7
Ka2 = 4.8e-11

# 2: provide total concentration for all mass balance equations
# conc_counter = 0 for H2A, conc for HA, 2*conc for A,
# for mixture of H2A and HA or mixture of HA and A, conc is sum
# of two concentrations and conc_counter is concentration of HA
# for mixture of H2A and HA, and sum of conc of HA and 2*A for
# mixture of HA and A
conc = 0.1
conc_counter = 0.2

# 3: set up master variable
pH = seq(1, 14, 0.001)

# 4: calculate concentrations for all species in system using 
# equilibrium constants and mass balance equations
H3O = 10^-pH
OH = Kw/H3O
H2A = conc/(1 + Ka1/H3O + Ka1*Ka2/H3O^2)
HA = conc/(H3O/Ka1 + 1 + Ka2/H3O)
A = conc - H2A - HA

# 5: define an error function using charge balance
error = abs(H3O + conc_counter - OH - HA - 2*A)

# 6: gather all results into data frame
df = data.frame(pH, error, H3O, OH, H2A, HA, A)

# 7: find index for the minimum error (error closest to zero)
id = which.min(df$error)
id

# 8: report out all values
df$pH[id]
df$H3O[id]
df$OH[id]
df$H2A[id]
df$HA[id]
df$A[id]
df$error[id]

# 9: plot error function
plot(df$pH, log10(df$error), type = "l", xlab = "pH", 
     ylab = "log(error)", lwd = 2, col = "blue")
abline(v = df$pH[id], lty = 2, col = "red", lwd = 2)

# 10: plot distribution diagrams
matplot(x = df$pH, y = df[ , 5:7], type = "l", 
        xlab = "pH", ylab = "concentration")
matplot(x = df$pH, y = log10(df[ , 3:7]), type = "l", 
        xlab = "pH", ylab = "log(concentration)")
