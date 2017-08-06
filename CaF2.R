# provide equilibrium constants for all reactions
Kw = 1.00e-14
Ka = 6.8e-4
Ksp = 3.9e-11

# provide total concentration for all mass balances
# NOTE: the mass balance equation does not include a known concentration

# set up master variable
pCa= seq(0, 14, 0.01)

# calculate concentrations of all species in system
Ca= 10^-pCa
Fl = sqrt(Ksp/Ca)
HF = 2 * Ca - Fl
H3O = Ka * HF/Fl
OH = Kw/H3O

# define error function using abolute value
error = abs(2 * Ca + H3O - OH - Fl)

# find the index for the minimum error (the error closest to zero)
id = which.min(error)
id

# report out all values
pCa[id]
Ca[id]
Fl[id]
HF[id]
H3O[id]
OH[id]

solubility = Ca
solubility[id]

# plot of error function (if of interest)
plot(pCa, log10(error), type = "l")

# solubility as a function of pH by calculating F
pH = seq(0, 14, 0.1)
H3O = 10^-pH
OH = Kw/H3O
Fl = ((2 * Ksp)/(1 + H3O/Ka))^(1/3)
HF = H3O * Fl/Ka
Ca = (HF + Fl)/2
solubility = Ca

plot(pH, solubility, type = "l")

plot(pH, log10(solubility), type = "l")

# solubility as a function of pH by calculating Ca
calcium = ((H3O * sqrt(Ksp) + Ka * sqrt(Ksp))/(2 * Ka))^(2/3)
sol = calcium
plot(pH, log10(sol), type = "l")
