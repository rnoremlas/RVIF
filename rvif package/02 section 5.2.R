rm(list=ls())
library(rvif) # call multiColl package

## Simulation 1

  set.seed(2024)
  obs = 3000 # no individual significance test is affected 
  cte = rep(1, obs)
  x2 = rnorm(obs, 5, 0.1)  # related to intercept: non essential
  x3 = rnorm(obs, 5, 10)
  x4 = x3 + rnorm(obs, 5, 0.5) # related to x3: essential
  x5 = rnorm(obs, -1, 3)
  x6 = rnorm(obs, 15, 2.5)
  y = 4 + 5*x2 - 9*x3 -2*x4 + 2*x5 + 7*x6 + rnorm(obs, 0, 2)
  X = cbind(cte, x2, x3, x4, x5, x6) 

    theoremSIMULATION1 = multicollinearity(y, X)  # rvif function
    rownames(theoremSIMULATION1) = c("Intercept", "X2", "X3", "X4", "X5", "X6")

    vifsSIMULATION1 = VIF(X) # multiColl function
    cnSIMULATION1 = CN(X) # multiColl function
    cvsSIMULATION1 = CVs(X) # multiColl function

## Simulation 2
    
  obs = 100 # decreasing the number of observations affected to intercept 
  cte = rep(1, obs)
  x2 = rnorm(obs, 5, 0.1)  # related to intercept: non essential
  x3 = rnorm(obs, 5, 10)
  x4 = x3 + rnorm(obs, 5, 0.5) # related to x3: essential
  x5 = rnorm(obs, -1, 3)
  x6 = rnorm(obs, 15, 2.5)
  y = 4 + 5*x2 - 9*x3 -2*x4 + 2*x5 + 7*x6 + rnorm(obs, 0, 2)
  X = cbind(cte, x2, x3, x4, x5, x6)
  
    theoremSIMULATION2 = multicollinearity(y, X) # rvif function
    rownames(theoremSIMULATION2) = c("Intercept", "X2", "X3", "X4", "X5", "X6")

    vifsSIMULATION2 = VIF(X) # multiColl function
    cnSIMULATION2 = CN(X) # multiColl function
    cvsSIMULATION2 = CVs(X) # multiColl function

## Simulation 3
  
  obs = 30 # decreasing the number of observations affected to intercept, x2 and x4 
  cte = rep(1, obs)
  x2 = rnorm(obs, 5, 0.1)  # related to intercept: non essential
  x3 = rnorm(obs, 5, 10)
  x4 = x3 + rnorm(obs, 5, 0.5) # related to x3: essential
  x5 = rnorm(obs, -1, 3)
  x6 = rnorm(obs, 15, 2.5)
  y = 4 + 5*x2 - 9*x3 -2*x4 + 2*x5 + 7*x6 + rnorm(obs, 0, 2)
  X = cbind(cte, x2, x3, x4, x5, x6)
  
    theoremSIMULATION3 = multicollinearity(y, X) # rvif function
    rownames(theoremSIMULATION3) = c("Intercept", "X2", "X3", "X4", "X5", "X6")

    vifsSIMULATION3 = VIF(X) # multiColl function
    cnSIMULATION3 = CN(X) # multiColl function
    cvsSIMULATION3 = CVs(X) # multiColl function

## Output

  traditionalSIMULATION = data.frame(c(cvsSIMULATION1, vifsSIMULATION1, cnSIMULATION1), 
                                   c(cvsSIMULATION2, vifsSIMULATION2, cnSIMULATION2), 
                                   c(cvsSIMULATION3, vifsSIMULATION3, cnSIMULATION3))
  rownames(traditionalSIMULATION) = c("X2 CV", "X3 CV", "X4 CV", "X5 CV", "X6 CV", "X2 VIF", "X3 VIF", "X4 VIF", "X5 VIF", "X6 VIF", "CN")
  colnames(traditionalSIMULATION) = c("Simulation 1", "Simulation 2", "Simulation 3")
  traditionalSIMULATION # Table 11: CVs, VIFs for data of Simulations 1, 2 and 3

  theoremSIMULATION1 # Table 12: Theorem results of the Simulation 1 model

  theoremSIMULATION2 # Table 13: Theorem results of the Simulation 2 model

  theoremSIMULATION3 # Table 14: Theorem results of the Simulation 3 model
  