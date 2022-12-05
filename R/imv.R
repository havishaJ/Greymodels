# Interval Multivariate Grey models

# Model 1 - IG-NDGM (1, 2) model: Interval grey number sequence based on non-homogeneous discrete grey model.

igndgm12 <- function(LB,UB){

  # Input data
  # LB is the lower bound of the sequence
  # UB is the upper bound of the sequence

  # Combine the two vectors (LB and UB)
  x0 <- cbind(LB,UB)

  # Length of sequence
  n <- length(LB)

  # Calculate mean of LB and UB
  mean <- numeric(n)
  for (i in 1:n){
    mean[i] <- (LB[i]+UB[i])/2
  }
  mean_values <- c(mean)

  # AGO
  x1_LB <- cumsum(LB)
  x1_UB <- cumsum(UB)

  # Create matrix y
  y_LB <- matrix(c(x1_LB),ncol=1)
  y_LB <- t(t(x1_LB[2:n]))
  y_UB <- matrix(c(x1_UB),ncol=1)
  y_UB <- t(t(x1_UB[2:n]))

  m <- length(y_LB)

  mat1_LB <- matrix(c(x1_LB),ncol=1)
  mat1_LB <- t(t(x1_LB[1:m]))
  mat1_UB <- matrix(c(x1_UB),ncol=1)
  mat1_UB <- t(t(x1_UB[1:m]))

  c <- numeric(m)

  for (i in 1:m){
    c[i] <- (i)
    c1 <- c[1:m]
  }

  # Create matrix B
  mat2 <-matrix(c(c1),ncol=1)
  mat3 <- matrix(1,nrow=m,ncol=1)

  B_LB <- cbind(mat1_LB,mat2,mat3)
  B_UB <- cbind(mat1_UB,mat2,mat3)

  # Parameters estimation by OLS
  betacap_LB <- (solve (t(B_LB) %*% B_LB)) %*% t(B_LB) %*% y_LB
  beta1_LB <- betacap_LB[1,1]
  beta2_LB <- betacap_LB[2,1]
  beta3_LB <- betacap_LB[3,1]

  betacap_UB <- (solve (t(B_UB) %*% B_UB)) %*% t(B_UB) %*% y_UB
  beta1_UB <- betacap_UB[1,1]
  beta2_UB <- betacap_UB[2,1]
  beta3_UB <- betacap_UB[3,1]

  # Calculate response sequence - Upper Bound
  xh <- replicate (n,0)
  for (k in 1:n-1){
    sm <- 0
    for (j in 1:k){
      sm <- sm + j*beta1_UB^(k-j)
    }
    xh[k+1] <- (beta1_UB^k)*UB[1] + beta2_UB*(sm) + ((1 - beta1_UB^k)/(1 - beta1_UB))*beta3_UB
  }
  x1cap_UB <- c(UB[1],xh[2:n])

  # Calculate restored values (Fitted values) - Upper bound
  x0cap_UB <- numeric(n)
  for (i in 1:n){
    x0cap_UB[i] <- x1cap_UB[i+1] - x1cap_UB[i]
  }
  x0cap_U <- c(UB[1],x0cap_UB[1:n-1])

  # Calculate response sequence - Lower Bound
  xL <- replicate (n,0)
  for (k in 1:n-1){
    sm <- 0
    for (j in 1:k){
      sm <- sm + j*beta1_LB^(k-j)
    }
    xL[k+1] <- (beta1_LB^k)*LB[1] + beta2_LB*(sm) + ((1 - beta1_LB^k)/(1 - beta1_LB))*beta3_LB
  }
  x1cap_LB <- c(LB[1],xL[2:n])

  # Calculate restored values (Fitted values) - Lower bound
  x0cap_LB <- numeric(n)
  for (i in 1:n){
    x0cap_LB[i] <- x1cap_LB[i+1] - x1cap_LB[i]
  }
  x0cap_L <- c(LB[1],x0cap_LB[1:n-1])

  # Calculate simulative mean
  s_mean <- (x0cap_U+x0cap_L)/2

  simulative_mean <- c(s_mean[1:n])

  # Generate fitted values of LB, UB and
  fitted_values <- matrix(c(x0cap_L,x0cap_U,simulative_mean),ncol=3)

  # A is the number of forecast values
  A <- 4

  # Predicted values - Upper bound
  xh_a <- replicate (n+A,0)
  for (k in 0 : n+A){
    sm <- 0
    for (j in 1:k){
      sm <- sm + j*beta1_UB^(k-j)
    }
    xh_a[k+1] <- (beta1_UB^k)*UB[1] + beta2_UB*(sm) + ((1 - beta1_UB^k)/(1 - beta1_UB))*beta3_UB
  }
  x1cap_UBa <- c(xh_a[1: n+A])

  t4_U <- length(x1cap_UBa)
  x0cap_UBa <- numeric(t4_U-1)
  for (i in 1 : t4_U-1){
    x0cap_UBa[i] <- x1cap_UBa[i+1] - x1cap_UBa[i]
  }
  x0cap_Ua <- c(x0cap_UBa[1 : t4_U-1])

  # Predicted values - Lower bound
  xL_a <- replicate (n+A,0)
  for (k in 0 : n+A){
    sm <- 0
    for (j in 1:k){
      sm <- sm + j*beta1_LB^(k-j)
    }
    xL_a[k+1] <- (beta1_LB^k)*LB[1] + beta2_LB*(sm) + ((1 - beta1_LB^k)/(1 - beta1_LB))*beta3_LB
  }
  x1cap_LBa <- c(xL_a[1 : n+A])

  t4_L <- length(x1cap_LBa)

  x0cap_LBa <- numeric(t4_L-1)

  for (i in 1 : t4_L-1){
    x0cap_LBa[i] <- x1cap_LBa[i+1] - x1cap_LBa[i]
  }
  x0cap_La <- c(x0cap_LBa[1 : t4_L-1])

  # Simulated Mean - LB and UB
  simulatedmean_a <- (x0cap_Ua+x0cap_La)/2

  x0cap4 <- c(simulatedmean_a)

  # Generate last A values of forecasts
  x0cap5a <- tail(x0cap4,A)
  x0cap5_U <- tail(x0cap_Ua,A)
  x0cap5_L <- tail(x0cap_La,A)

  x0cap5 <- matrix(c(x0cap5_L,x0cap5_U),ncol=2)

  x0cap2_U <- c(x0cap_U,x0cap5_U)
  x0cap2_L <- c(x0cap_L,x0cap5_L)
  SM <- c( simulative_mean ,x0cap4)

  x0cap2 <- matrix(c(x0cap2_L,x0cap2_U,SM),ncol=3)
  return(x0cap2)

}



# Model 2 - MDBGM (1, 2) model: Multivariate grey model based on dynamic background algorithm.

mdbgm12 <- function(x01L,x01U,x02L,x02U,x01La,x01Ua,x02La,x02Ua){

  # Input data
  #x01 Lower and upper bound of sequence 1
  #x02 Lower and upper bound of sequence 2

  # x01L is the lower bound of sequence 1
  # x01U is the upper bound of sequence 1
  # x02L is the lower bound of sequence 2
  # x02U is the upper bound of sequence 2

  x01 <- cbind(x01L,x01U)
  x02 <- cbind(x02L,x02U)

  # AGO
  x11L <- cumsum(x01L)
  x11U <- cumsum(x01U)

  x11 <- cbind(x11L,x11U)

  x12L <- cumsum(x02L)
  x12U <- cumsum(x02U)

  x12 <- cbind(x12L,x12U)

  # Length of sequence
  n <- length(x01L)

  # Background values
  b <- numeric(n)
  for (i in 1:n){
    b[i] <- (0.5*x11L[i + 1] + 0.5*x11L[i])
    b1 <- b[1:n-1]
  }
  z1L <- matrix(c(b1),ncol=1)

  n <- length(x01L)
  d <- numeric(n)
  for (i in 1:n){
    d[i] <- (0.5*x11U[i + 1] + 0.5*x11U[i])
    d1 <- d[1:n-1]
  }
  z1U <- matrix(c(d1),ncol=1)

  # Create matrix Y
  YL <- matrix(c(x01L[2:n]),ncol=1)
  YU <- matrix(c(x01U[2:n]),ncol=1)

  # Create matrix X
  mat1 <- matrix(c(x12L[2:n]),ncol=1)
  mat2 <- matrix(c(x12U[2:n]),ncol=1)
  mat3 <- matrix(c(x11L[1:n-1]),ncol=1)
  mat4 <- matrix(c(x11U[1:n-1]),ncol=1)
  mat5 <- matrix(2:n,nrow=n-1,ncol=1)
  mat6 <- matrix(1,nrow=n-1,ncol=1)

  X <- cbind(mat1,mat2,mat3,mat4,mat5,mat6)

  # Parameters estimation by OLS - Lower
  A1 <- solve (t(X) %*% X) %*% t(X) %*% YL
  miu11 <- A1[1,1]
  miu12 <- A1[2,1]
  gamma11 <- A1[3,1]
  gamma12 <- A1[4,1]
  g1 <- A1[5,1]
  h1 <- A1[6,1]

  # Parameters estimation by OLS - Upper
  A2 <- solve (t(X) %*% X) %*% t(X) %*% YU
  miu21 <- A2[1,1]
  miu22 <- A2[2,1]
  gamma21 <- A2[3,1]
  gamma22 <- A2[4,1]
  g2 <- A2[5,1]
  h2 <- A2[6,1]

  # Fitted values - Lower
  scale_with <- function(k)
  {
    (miu11*x12L[k]) + (miu12*x12U[k]) + (gamma11*x11L[k-1]) + (gamma12*x11U[k-1]) + (g1*k) + h1
  }
  forecast_L <- scale_with(2:n)
  x0cap1L <- c(x01L[1],forecast_L)

  # Fitted values - Upper
  scale_with <- function(k)
  {
    (miu21*x12L[k]) + (miu22*x12U[k]) + (gamma21*x11L[k-1]) + (gamma22*x11U[k-1]) + (g2*k) + h2
  }
  forecast_U <- scale_with(2:n)
  x0cap1U <- c(x01U[1],forecast_U)

  # Matrix of fitted values (lower and upper)
  x0cap <- matrix(c(cbind(x0cap1L,x0cap1U)),ncol=2)

  # A is the number of values to predict
  A <- 4

  # Out-sample data (x01La, x01Ua, x02La, x02Ua)

  # Calculation of predicted values

  # AGO of testing data
  x11La <- cumsum(x01La)
  x11Ua <- cumsum(x01Ua)
  x12La <- cumsum(x02La)
  x12Ua <- cumsum(x02Ua)

  x0cap1La <- replicate(n+A,0)

  # Forecasts - Upper Bound
  scale_with <- function(k)
  {
    (miu11*x12La[k]) + (miu12*x12Ua[k]) + (gamma11*x11La[k-1]) + (gamma12*x11Ua[k-1]) + (g1*k) + h1
  }
  forecast_La <- scale_with(2:n+A)
  x0cap1La <- c(x01L[1],forecast_La)

  x0cap1Ua <- replicate(n+A,0)

  # Forecasts - Lower Bound
  scale_with <- function(k)
  {
    (miu21*x12La[k]) + (miu22*x12Ua[k]) + (gamma21*x11La[k-1]) + (gamma22*x11Ua[k-1]) + (g2*k) + h2
  }
  forecast_Ua <- scale_with(2:n+A)
  x0cap1Ua <- c(x01U[1],forecast_Ua)

  x0cap4 <- matrix(c(cbind(x0cap1La,x0cap1Ua)),ncol=2)

  x0cap5 <- tail(x0cap4,A)
  x0cap5_U <- tail(x0cap1Ua,A)
  x0cap5_L <- tail(x0cap1La,A)

  x0cap2_U <- c(x0cap1U,x0cap5_U )
  x0cap2_L <- c(x0cap1L,x0cap5_L )
  x0cap2 <- matrix(c(x0cap2_L,x0cap2_U),ncol=2)
  return(x0cap2)

}

