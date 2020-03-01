ag_Nh3 <- function(x) {
  K1 = 10^3.4
  K2 = 10^4.0
  Kb = 10^-4.75
  Kw = 10^-14
  
  conc_ag = 0.01
  conc_nh3 = 0.02
  
  # x[1] = H3O; x[2] = OH; x[3] = NH3; x[4] = NH4; x[5] = Ag, x[6] = AgN, x[7] = AgN2
  
  K_1 = K1 - x[6]/(x[5] * x[3])
  K_2 = K2 - x[7]/(x[6] * x[3])
  K_b = Kb - x[2] * x[4]/x[3]
  K_w = Kw - (x[1] * x[2])
  MB_ag = conc_ag - x[5] - x[6] - x[7]
  MB_nh3 = conc_nh3 - x[3] - x[4] - x[6] - 2 * x[7]
  CB = x[1] + x[4] + x[5] + x[6] + x[7] - x[2] - conc_ag
  
  return(c(K_1, K_2, K_b, K_w, MB_ag, MB_nh3, CB))
  
}

nleqslv(x = c(1e-7, 1e-7, 0.01, 1e-7, 0.02, 0.02, 0.02), 
        fn = ag_Nh3, 
        control = list(xtol = 1e-14, ftol = 1e-14))
