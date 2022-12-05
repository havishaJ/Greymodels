# Extended forms of grey models

#' A function
#'
#' @param x0 is the original sequence
#' @param k
#' @param k_A is the data index (testing set)
#' @param x0_A is the actual data (testin set)
#'
#' @return
#' @importFrom utils tail
#' @export


# Model 1 - DGM (1, 1): Discrete grey model with single variable and first order differential equation

dgm11 <- function(x0) {

  # Input data x0

  # Calculate accumulated generating operation (AGO)
  x1 <- cumsum(x0)

  # n is the length of sequence x0
  n <- length(x0)

  # Create matrix yn
  yn <- matrix(c(x1),ncol=1)
  yn <- t(t(x1[2:n]))

  # Create matrix B
  mat1 <- matrix(c(x1),ncol=1)
  mat1 <- t(t(x1[1:n-1]))
  mat2 <- matrix(1,nrow=n-1,ncol=1)
  B <- cbind(mat1, mat2)

  # Parameters estimation by ordinary least squares method (OLS)
  xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
  beta1 <- xcap[1,1]
  beta2 <- xcap[2,1]

  # Calculate restored values (fitted values x0cap)
  scale_with <- function(k)
  {
    beta1^k *( x0[1]-beta2/(1-beta1) ) + beta2/(1-beta1)
  }
  fitted <- scale_with(1:n-1)
  x0cap <- numeric(n-1)

  for (i in 1:n-1) {
    x0cap[i] <- fitted[i+1] - fitted[i]
  }
  x0cap1 <- c(x0[1],x0cap[1:n-1])

  # a is the number of forecast values
  a <- 4

  x1cap4 <- scale_with(1 : n+a-1 )
  t4 <- length(x1cap4)
  x0cap4 <- numeric(t4)
  for (i in 1:t4-1) {
    x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
  }
  x0cap4 <- c(x0[1],x0cap4[1:t4-1])
  x0cap5 <- tail(x0cap4,a)

  x0cap2 <- c(x0cap1,x0cap5)
  return(x0cap2)

}


# Model 2 - DGM (2, 1): Discrete grey model with single variable and second order differential equation

dgm21 <- function(x0) {

  # Input data x0

  # Calculate accumulated generating operation (AGO)
  x1 <- cumsum(x0)

  # n is the length of sequence x0
  n <- length(x0)

  d <- -x0

  # Create matrix B
  mat1 <- matrix(c(d[2:n]),ncol=1)
  mat2 <- matrix(1,nrow=n-1,ncol=1)
  B <- cbind(mat1,mat2)

  # Create matrix y
  f <- numeric(n)
  for (i in 1:n){
    f[i] <- x0[i+1]-x0[i]
  }
  y <- matrix(c(f[1:n-1]),ncol=1)

  m <- length(y)

  # Parameters estimation by ordinary least squares method (OLS)
  xcap <- solve (t(B) %*% B) %*% t(B) %*% y
  a <- xcap[1,1]
  b <- xcap[2,1]

  scale_with <- function(k)
  {
    ( (b/(a^2)) - (x0[1]/a) )* ( 1 - exp(a) )* exp(-a*k) + (b/a)
  }
  fitted <- scale_with(1:m)
  x0cap <- c(x0[1],fitted)

  # A is the number of forecast values
  A <- 4
  x0cap4 <- scale_with(1 : n+A-1 )
  x0cap5 <- tail(x0cap4,A)

  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}


# Model 3 - ODGM (2, 1): Optimized discrete grey model with single variable and second order differential equation

odgm21 <- function(x0) {

  # Input data x0

  # n is the length of sequence x0
  n <- length(x0)

  d <- -x0

  # Create matrix B
  mat1 <- matrix(c(d[3:n]),ncol=1)
  mat2 <- matrix(1,nrow=n-2,ncol=1)
  B <- cbind(mat1,mat2)

  z <- length(mat1)

  # Create matrix y
  f <- numeric(n)
  for (i in 3:n){
    f[i] <- (((x0[i]-x0[i-1])^2) /(x0[i]-(2*x0[i-1])+x0[i-2])) * (log((x0[i]-x0[i-1])/(x0[i-1]-x0[i-2])))
  }
  y <- matrix(c(f[3:n]),ncol=1)

  m <- length(y)

  # Parameters estimation by ordinary least squares method (OLS)
  xcap <- solve (t(B) %*% B) %*% t(B) %*% y
  a <- xcap[1,1]
  b <- xcap[2,1]

  for (k in 1:n-1){
    sm1 <- 0
    sm2 <- 0
    for (i in 1:k){
      sm1 <- sm1 + ( (b/(a^2))*(1-exp(a))*exp(-2*a*(i-1)) ) + ( (b/a)*exp(-a*(i-1)) ) - (x0[i]*exp(-a*(i-1)))
      sm2 <- sm2 + ((1-exp(a))/a)*exp(-2*a*(i-1))
    }
  }
  gamma <- sm1/sm2
  m <- length(y)

  scale_with <- function(k)
  {
    ( (b/(a^2)) - (gamma/a) )* exp(-a*k) + ((b/a)*(k+1)) + ((gamma-(b/a))*((1+a)/a))
  }
  forecast <- scale_with(0:n)
  x1cap <- c(x0[1],forecast)
  x0cap1 <- numeric(n)

  for (i in 1:n) {
    x0cap1[i] <- x1cap[i+1] - x1cap[i]
  }
  x0cap <- c(x0[1],x0cap1[2:n])

  # A is the number of forecast values
  A <- 4

  x1cap4 <- scale_with(1 : n+A-1 )
  t4 <- length(x1cap4)
  x0cap4 <- numeric(t4)
  for (i in 1:t4-1) {
    x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
  }
  x0cap4 <- c(x0[1],x0cap4[1:t4-1])
  x0cap5 <- tail(x0cap4,A)

  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}


# Model 4 - NDGM (1, 1): Non-homogeneous discrete grey model

ndgm11 <- function(x0) {

  # Input data x0

  # Calculate accumulated generating operation (AGO)
  x1 <- cumsum(x0)

  # n is the length of sequence x0
  n <- length(x0)

  # Create matrix y
  y <- matrix(c(x1),ncol=1)
  y <- t(t(x1[2:n]))

  m <- length(y)
  mat1 <- matrix(c(x1),ncol=1)
  mat1 <- t(t(x1[1:m]))
  c <- numeric(m)
  for (i in 1:m){
    c[i] <- (i)
    c1 <- c[1:m]
  }

  # Create matrix B
  mat2 <-matrix(c(c1),ncol=1)
  mat3 <- matrix(1,nrow=m,ncol=1)
  B <- cbind(mat1,mat2,mat3)

  # Parameters estimation (beta1, beta2 and beta3) by ordinary least squares method (OLS)
  betacap <- (solve (t(B) %*% B)) %*% t(B) %*% y
  beta1 <- betacap[1,1]
  beta2 <- betacap[2,1]
  beta3 <- betacap[3,1]

  xL <- replicate (n-1,0)
  for (k in 1:n-1){
    sm <- 0
    for (j in 1:k){
      sm <- sm + j*beta1^(k-j)
    }
    xL[k+1] <- (beta1^k)*x1[1] + beta2*(sm) + ((1 - beta1^k)/(1 - beta1))*beta3
  }
  x1cap <- c(x0[1],xL[2:n])
  x0cap1 <- numeric(n)
  for (i in 1:n){
    x0cap1[i] <- x1cap[i+1] - x1cap[i]
  }
  x0cap <- c(x0[1],x0cap1[1:n-1])

  # a is the number of forecast values
  a <- 4

  #' Predicted values
  xLa <- replicate (n+a,0)
  for (k in 1:n+a){
    sm <- 0
    for (j in 1:k){
      sm <- sm + j*beta1^(k-j)
    }
    xLa[k+1] <- (beta1^k)*x1[1] + beta2*(sm) + ((1 - beta1^k)/(1 - beta1))*beta3
  }
  x1capa <- c(xLa[1:n+a])
  at <- length(x1capa)
  x0cap1a <- numeric(at)
  for (i in 1:at-1){
    x0cap1a[i] <- x1capa[i+1] - x1capa[i]
  }
  x0cap4 <- c(x0[1],x0cap1a[1:at-1])
  x0cap5 <- tail(x0cap4,a)

  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}


# Model 5 - VSSGM (1, 1): Variable speed and adaptive structure-based grey model

vssgm11 <- function(x0){

  # Input data x0

  # Calculate accumulated generating operation (AGO)
  x1 <- cumsum(x0)

  # n is the length of sequence x0
  n <- length(x0)

  d <- numeric(n)
  for (i in 1:n){
    d[i] <- -0.5*(x1[i+1] + x1[i])
  }
  d1 <- d[1:n-1]
  mat1 <- matrix(c(d1),ncol=1)

  # Create matrix y
  y <- matrix(c(x0),ncol=1)
  y <- t(t(x0[2:n]))

  c <- numeric(n)
  for (i in 1:n){
    c[i] <- (i^3)
  }
  c1 <- c[2:n]
  mat2 <-matrix(c(c1),ncol=1)
  f <- numeric(n)
  for (i in 1:n){
    f[i] <- (i^2)
  }
  f1 <- f[2:n]
  mat3 <-matrix(c(f1),ncol=1)
  g <- numeric(n)
  for (i in 1:n){
    g[i] <- (i)
  }
  g1 <- g[2:n]

  # Create matrix B
  mat4 <-matrix(c(g1),ncol=1)
  mat5 <- matrix(1,nrow=n-1,ncol=1)
  B <- cbind(mat1, mat2, mat3, mat4, mat5)

  # Parameters estimation by ordinary least squares method (OLS)
  acap <- (solve (t(B) %*% B)) %*% t(B) %*% y
  a <- acap[1,1]
  b1 <- acap[2,1]
  b2 <- acap[3,1]
  b3 <- acap[4,1]
  b4 <- acap[5,1]

  b <- c(b1,b2,b3,b4)

  m <- (1-(0.5*a))/(1+(0.5*a))
  nn <- 1/(1+(0.5*a))
  scale_with <- function(k)
  {
    m^(k-1) * x0[1]
  }
  forecast1 <- scale_with(2:n)
  M1 <- matrix(c(forecast1),nrow=n-1,ncol=1)
  forecast2 <- replicate(n-1,0)
  for (k in 2:n){
    sm <- 0
    for (i in 2:k){
      for (j in 1:4){
        sm <- sm + nn*( b[j] * ( m^(k-i) * i^(4-j) ) )
      }
      forecast2[k] <- 1*sm
    }
  }
  M2 <- matrix(c(forecast2[2:n]),nrow=n-1,ncol=1)
  Total <- M1 + M2
  total <- matrix(c(Total),nrow=n-1,ncol=1)
  xcap1 <- c(x0[1],total)
  x0cap2 <- numeric(n)
  for (i in 1:n){
    x0cap2[i] <- xcap1[i+1] - xcap1[i]
  }
  x0cap <- c(x0[1],x0cap2[1:n-1])

  # A is the number of forecast values
  A <- 4

  newn <- n + A
  scale_with <- function(k)
  {
    m^(k-1) * x0[1]
  }
  forecast1new <- scale_with(2:newn)
  M1new <- matrix(c(forecast1new),nrow=newn-1,ncol=1)
  forecast2new <- replicate(newn-1,0)
  for (k in 2:newn){
    sm <- 0
    for (i in 2:k){
      for (j in 1:4){
        sm <- sm + nn*( b[j] * ( m^(k-i) * i^(4-j) ) )
      }
      forecast2new[k] <- 1*sm
    }
  }
  M2new <- matrix(c(forecast2new[2:newn]),nrow=newn-1,ncol=1)
  Totalnew <- M1new + M2new
  totalnew <- matrix(c(Totalnew),nrow=newn-1,ncol=1)
  xcap1new <- c(x0[1],totalnew)
  x0cap2new <- numeric(newn)
  for (i in 1:newn){
    x0cap2new[i] <- xcap1new[i+1] - xcap1new[i]
  }
  x0cap4 <- c(x0[1],x0cap2new[1:newn-1])
  x0cap5 <- tail(x0cap4,A)
  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}


# Model 6 - GOM (1, 1): Grey opposite-direction model based on inverse accumulation and traditional interpolation method

gom11 <- function(x0){

  # Input data x0

  # n is the length of sequence x0
  n <- length(x0)

  x1 <- numeric(n)
  for (i in 1:n){
    x1[i] <- sum(x0[i:n])
  }

  b <- numeric(n)
  for (i in 2:n){
    b[i] <- -( (x1[i]-x1[i-1]) / (log (x1[i])-log (x1[i-1])) )
  }

  # Create matrix B
  mat1 <- matrix(c(b[2:n]),ncol=1)
  mat2 <- matrix(1,nrow=n-1,ncol=1)
  B <- cbind(mat1,mat2)

  r <- -x0

  # Create matrix y
  y <- matrix(c(r),ncol=1)
  y <- t(t(r[1:n-1]))

  # Parameters estimation by ordinary least squares method (OLS)
  xcap <- solve (t(B) %*% B) %*% t(B) %*% y
  a <- xcap[1,1]
  b <- xcap[2,1]

  scale_with <- function(k)
  {
    (x1[1] - (b/a)) * exp(-a*k) * (exp(a)-1)
  }
  x0cap <- scale_with(1:n)

  # A is the number of forecast values
  A <- 4

  x0cap4 <- scale_with(1 : n+A )
  x0cap5 <- tail(x0cap4,A)
  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}


# Model 7 - GOM_IA (1, 1): Grey opposite-direction model based on inverse accumulation

gomia11 <- function(x0){

  # Input data x0

  # n is the length of sequence x0
  n <- length(x0)

  x1 <- numeric(n)
  for (i in 1:n){
    x1[i] <- sum(x0[i:n])
  }

  b <- numeric(n)

  alpha <- 0.5

  # Create matrix y
  for (i in 1:n){
    b[i] <- (-alpha*x0[i])-((1-alpha)*x0[i+1])
  }
  y <- matrix(c(b[1:n-1]),ncol=1)

  x11 <- -x1

  # Create matrix B
  mat1 <- matrix(c(x11),ncol=1)
  mat1 <- t(t(x11[2:n]))
  mat2 <- matrix(1,nrow=n-1,ncol=1)
  B <- cbind(mat1,mat2)

  # Parameters estimation by ordinary least squares method (OLS)
  xcap <- solve (t(B) %*% B) %*% t(B) %*% y
  a <- xcap[1,1]
  b <- xcap[2,1]

  scale_with <- function(k)
  {
    (x1[n] - (b/a)) * exp(-a*(k-n)) + (b/a)
  }
  forecast <- scale_with(1:n)
  x1cap <- c(forecast)

  x0cap1 <- numeric(n)

  for (i in 1:n-1)
    x0cap1[i] <- x1cap[i] - x1cap[i+1]
  x0cap <- c(x0cap1[1:n-1],x1[n])

  # A is the number of forecast values
  A <- 4

  x1cap4 <- scale_with(1 : n+A )
  t4 <- length(x1cap4)
  x0cap1a <- numeric(t4)
  for (i in 1:t4){
    x0cap1a[i] <- x1cap4[i] - x1cap4[i+1]
  }
  x0cap4 <- c(x0cap1a[1:t4-1])
  x0cap5 <- tail(x0cap4,A)
  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}


# Model 8 - unbiased GOM (1, 1): Unbiased grey opposite-direction model based on inverse accumulation

ungom11 <- function(x0){

  # Input data x0

  # n is the length of sequence x0
  n <- length(x0)

  x1 <- numeric(n)
  for (i in 1:n){
    x1[i] <- sum(x0[i:n])
  }

  # Create matrix B
  mat1 <- matrix(c(x1),ncol=1)
  mat1 <- t(t(x1[1:n-1]))
  mat2 <- matrix(1,nrow=n-1,ncol=1)
  B <- cbind(mat1,mat2)

  # Create matrix y
  y <- matrix(c(x1),ncol=1)
  y <- t(t(x1[2:n]))

  # Parameters estimation (beta1 and beta2) by ordinary least squares method (OLS)
  xcap <- solve (t(B) %*% B) %*% t(B) %*% y
  beta1 <- xcap[1,1]
  beta2 <- xcap[2,1]

  a <- - log(beta1)
  b <- (beta2/(1-beta1))*a

  scale_with <- function(k)
  {
    (x1[n] - (b/a)) * exp(-a*(k-n)) + (b/a)
  }
  forecast <- scale_with(1:n)
  x1cap <- c(forecast)
  x0cap1 <- numeric(n)
  for (i in 1:n-1){
    x0cap1[i] <- x1cap[i] - x1cap[i+1]
  }
  x0cap <- c(x0cap1[1:n-1],x1[n])

  # A is the number of forecast values
  A <- 4

  x1cap4 <- scale_with(1 : n+A )
  t4 <- length(x1cap4)
  x0cap1a <- numeric(t4)

  for (i in 1:t4){
    x0cap1a[i] <- x1cap4[i] - x1cap4[i+1]
  }
  x0cap4 <- c(x0cap1a[1:t4-1])
  x0cap5 <- tail(x0cap4,A)

  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}


# Model 9 - EXGM (1, 1): Exponential grey model

exgm11 <- function(x0){

  # Input data x0

  # Calculate accumulated generating operation (AGO)
  x1 <- cumsum(x0)

  # n is the length of sequence x0
  n <- length(x0)

  # Create matrix y
  y <- matrix(c(x0),ncol=1)
  y <- t(t(x0[2:n]))

  b <- numeric(n)
  for (i in 1:n){
    b[i] <- -0.5*(x1[i+1] + x1[i])
  }
  b1 <- b[1:n-1]

  # Create matrix B2
  mat1 <- matrix(c(b1),ncol=1)
  mat2 <- matrix(1,nrow=n-1,ncol=1)
  f <- numeric(n)
  for (i in 1:n){
    f[i] <- ( exp(1) - 1) * exp(-i)
  }
  f1 <- f[2:n]

  mat3 <- matrix(c(f1),ncol=1)
  B2 <- cbind(mat1, mat2, mat3)

  # Parameters estimation (a, b and c) by ordinary least squares method (OLS)
  rcap <- (solve (t(B2) %*% B2)) %*% t(B2) %*% y
  a <- rcap[1,1]
  b <- rcap[2,1]
  c <- rcap[3,1]

  scale_with <- function(k)
  {
    ( x1[1] - (b/a) - ( ( c/(a-1) )*exp(-1) ) ) * exp(a*(1-k)) + (b/a) + ( c/(a-1) )*exp(-k)
  }
  forecast1 <- scale_with(1:n)
  x1cap <- c(forecast1)
  x0cap1 <- numeric(n)
  for (i in 1:n){
    x0cap1[i] <- x1cap[i+1] - x1cap[i]
  }
  x0cap <- c(x0[1],x0cap1[1:n-1])

  # A is the number of forecast values
  A <- 4

  x1cap4 <- scale_with(1 : n+A )
  t4 <- length(x1cap4)
  x0cap4 <- numeric(t4-1)
  for (i in 1:t4-1) {
    x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
  }
  x0cap4 <- c(x0[1],x0cap4[1:t4-1])
  x0cap5 <- tail(x0cap4,A)

  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}


# Model 10 - EGM (1, 1): Extended grey model

egm11 <- function(k,x0,k_A,x0_A){

  # Training set (In-sample)
  # k is the data index
  # x0 is the actual data

  # Testing set (Out-sample)
  # k_A is the data index
  # x0_A is the actual data

  # n is the length of sequence x0
  n <- length(x0)

  # Calculate gap of each paired data index
  deltak <- replicate(n-1,0)
  for (i in 1:n){
    deltak[i] <- k[i+1]-k[i]
  }
  delta_k <- c(0,deltak[1:n-1])

  # Calculate normalization gap
  g <- replicate(n,0)
  for (i in 1:n){
    g[i] <- ( delta_k[i]/(k[n]-k[1]) )* (n-1)
  }

  # Calculate AGO to form new data series
  sk <- replicate(n-1,0)
  for (i in 2:n){
    sm <- 0
    for (j in 2:i){
      sm <- sm + x0[j]*g[j]
    }
    sk[i] <- x0[1] + sm
  }
  x1_k <- c(x0[1],sk[2:n])

  # Calculate background values Z
  b <- numeric(n)
  for (i in 1:n)
    b[i] <- -(0.5*x1_k[i + 1] + 0.5*x1_k[i])
  b1 <- b[1:n-1]

  # Create matrix B
  B <- matrix(1,nrow=n-1,ncol=2)
  B[,1] <- t(t(b1[1:n-1]))

  # Create matrix yn
  yn <- matrix(c(x0),ncol=1)
  yn <- t(t(x0[2:n]))

  # Parameters estimation
  xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
  a <- xcap[1,1]
  b <- xcap[2,1]

  # K is the sum of the normalization gap
  K <- replicate(n-1,0)
  for (i in 2:n){
    K[i] <- ((k[i]-k[1])/(k[n]-k[1]))*(n-1)
  }

  vector_K <- c(K)

  # Compute restored values (fitted values x0cap)

  x0cap1 = function(vector_K) {

    if(vector_K == 0) {

      x0cap1 <- x0[1]

    } else if(vector_K - (floor(vector_K)) == 0) {

      x0cap1 <- (x0[1] - (b/a)) * exp(-a*vector_K) + (b/a) - ( (x0[1] - (b/a)) * exp(-a*(vector_K-1)) + (b/a) )

    } else  {

      x0cap1 <- ( (x0[1] - (b/a)) * exp(-a*vector_K) + (b/a) - ( (x0[1] - (b/a)) * exp(-a*(floor(vector_K))) + (b/a) ) ) / (vector_K - floor(vector_K))
    }

  }

  x0cap <- sapply(vector_K, x0cap1)

  m <- length(k_A)

  KA <- replicate(m,0)
  for (i in 1:m){
    KA[i] <- ((k_A[i]-k_A[1])/(k[n]-k_A[1]))*(n-1)
  }

  vector_KA <- c(KA)

  # Calculate predicted values

  x0capA = function(vector_KA) {

    if(vector_KA == 0) {

      x0capA <- x0[1]

    } else if(vector_KA - (floor(vector_KA)) == 0) {

      x0capA <- (x0[1] - (b/a)) * exp(-a*vector_KA) + (b/a) - ( (x0[1] - (b/a)) * exp(-a*(vector_KA-1)) + (b/a) )

    } else  {

      x0capA <- ( (x0[1] - (b/a)) * exp(-a*vector_KA) + (b/a) - ( (x0[1] - (b/a)) * exp(-a*(floor(vector_KA))) + (b/a) ) ) / (vector_KA - floor(vector_KA))
    }

  }

  x0cap4 <- sapply(vector_KA, x0capA)

  # Number of values to forecast
  A <- 4

  x0cap5 <- tail(x0cap4,A)

  # x0cap2 is the sequence of fitted and predicted values
  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}








