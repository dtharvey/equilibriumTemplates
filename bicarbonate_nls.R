bicarbonate <- function(x) {
  ka1 = 4.3e-7
  ka2 = 4.8e-11
  kw = 1.0e-14
  conc = 1e-6
  # x[1] = H3O+; x[2] = OH-; x[3] = H2CO3; x[4] = HCO3-; x[5] = CO32-
  KA1 = ka1 - (x[1] * x[4] / x[3])
  KA2 = ka2 - (x[1] * x[5] / x[4])
  KW = kw - (x[1] * x[2])
  MB = conc - x[3] - x[4] - x[5]
  CB = x[1] + conc - x[2] - x[4] - (2 * x[5])
  
  return(c(KA1, KA2, KW, MB, CB))
  
}

nleqslv(x = c(1e-7, 1e-7, 1e-8, 1e-6, 1e-8), 
        fn = bicarbonate, 
        control = list(xtol = 1e-14, ftol = 1e-14))

nleqslv(x = c(0.1, 0.1, 0.1, 0.1, 0.1), 
        fn = bicarbonate, 
        control = list(xtol = 1e-12, ftol = 1e-12))

nleqslv(x = rep(0.1, 5), 
        fn = bicarbonate, 
        control = list(xtol = 1e-14, ftol = 1e-14))