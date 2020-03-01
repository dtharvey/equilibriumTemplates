conc_ag = 0.01
conc_nh3 = 0.02

K1 = 10^3.4
K2 = 10^4.0
Kb = 10^-4.75
Kw = 10^-14

pNH3 = seq(10^-0.02, 14, 0.01)
NH3 = 10^-pNH3

Ag = conc_ag/(1 + K1 * NH3 + K1 * K2 * NH3^2)
AgN = K1 * Ag * NH3
AgN2 = K1 * K2 * Ag * NH3^2
NH4 = conc_nh3 - NH3 - AgN - 2*AgN2
OH = Kb * NH3/NH4
H3O = Kw/OH

error = abs(NH4 + Ag + H3O + AgN + AgN2 - OH - conc_ag)

id = which.min(error)

NH3[id]
Ag[id]
AgN[id]
AgN2[id]
NH4[id]
OH[id]
H3O[id]

df = data.frame(NH3, Ag, AgN, AgN2, NH4, OH, H3O)
df_keep = subset(df, H3O > 0)

matplot(x = -log10(df_keep$H3O), y = df_keep[c(1, 5, 2, 3, 4)], 
        type = "l", lty = 1:5, col = 1:5, lwd = 2)
legend(x = "topright", legend = c("NH3", "NH4", "Ag", "AgN", "AgN2"), 
       bty = "n", lty = 1:5, col = 1:5, lwd = 2)
abline(v = -log10(df$H3O[id]))
