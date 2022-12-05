# Parameters Estimation of grey models


#' A function
#'
#' @param x0 is the original sequence
#'
#' @return
#' @importFrom utils tail
#' @importFrom cmna quadratic
#' @export

# Model 1 - SOGM (2, 1) model: Structured optimized grey model with single variable and second order differential equation

sogm21 <- function(x0){

  # Input data x0

  n <- length(x0)

  # AGO
  x1 <- cumsum(x0)

  # Create matrix y
  y <- matrix(c(x0),ncol=1)
  y <- t(t(x0[2:n]))

  xminus <- numeric(n)

  for (i in 1:n){
    xminus[i] <- -(x0[i+1] - x0[i])
  }
  xminus1 <- xminus[1:n-1]

  mat1 <- matrix(c(xminus1),ncol=1)

  d <- numeric(n)
  for (i in 1:n){
    d[i] <- -0.5*(x1[i+1] + x1[i])
  }
  d1 <- d[1:n-1]

  # Create matrix B2
  mat2 <- matrix(c(d1),ncol=1)
  mat3 <- matrix(1,nrow=n-1,ncol=1)
  B2 <- cbind(mat1, mat2, mat3)

  # Parameters estimation by OLS
  p <- (solve (t(B2) %*% B2)) %*% t(B2) %*% y
  alpha1 <- p[1,1]
  alpha2 <- p[2,1]
  b <- p[3,1]

  omega1 <- quadratic(alpha1,1,alpha2)
  omega <- matrix(c(omega1),ncol=1)

  r1 <- omega[1,1]
  r2 <- omega[2,1]
  delta <- r1*r2

  # Calculate c1 and c2
  c1 <- ( (r2*exp(r2*(n-1))*x0[n]) - (r2*exp(r2*(n))*x0[n-1]) ) / ( (r1*r2*exp((r1*n)+(r2*(n-1)))) - (r1*r2*exp((r2*n)+(r1*(n-1)))) )
  c2 <- ( (r1*exp(r1*(n))*x0[n-1]) - (r1*exp(r1*(n-1))*x0[n]) ) / ( (r1*r2*exp((r1*n)+(r2*(n-1)))) - (r1*r2*exp((r2*n)+(r1*(n-1)))) )
  x0cap1 <- numeric(n)
  for (k in 1:n){
    if (delta < 1/4){
      x0cap1[k] <- (c1*r1*exp(r1*k)) + (c2*r2*exp(r2*k))
    } else if (delta <- 1/4) {
      r <- r1
      x0cap1[k] <- ( (r*c1) + (r*c2*k) + c2 )*exp(r*k)
    }
  }
  x0cap <- c(x0cap1)

  A <- 4

  x0cap4 <- numeric(n+A)
  for (k in 1:n+A){
    if (delta < 1/4){
      x0cap4[k] <- (c1*r1*exp(r1*k)) + (c2*r2*exp(r2*k))
    } else if (delta <- 1/4) {
      r <- r1
      x0cap4[k] <- ( (r*c1) + (r*c2*k) + c2 )*exp(r*k)
    }
  }
  x0cap5 <- tail(x0cap4,A)

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}


# Model 2 - NGM (1, 1, k) model: Nonlinear grey model

ngm11k <- function(x0){

  # Input data x0

  # AGO
  x1 <- cumsum(x0)

  n <- length(x0)

  # Create matrix yn
  yn <- matrix(c(x0),ncol=1)
  yn <- t(t(x0[2:n]))

  b <- numeric(n)
  for (i in 1:n){
    b[i] <- -0.5*(x1[i+1] + x1[i])
    b1 <- b[1:n-1]
  }
  mat1 <- matrix(c(b1),ncol=1)

  c <- numeric(n)
  for (i in 1:n){
    c[i] <- (i)
    c1 <- c[2:n]
  }
  mat2 <-matrix(c(c1),ncol=1)

  # Create matrix B2
  B2 <- cbind(mat1, mat2)

  # Parameters estimation by OLS
  rcap <- (solve (t(B2) %*% B2)) %*% t(B2) %*% yn
  a <- rcap[1,1]
  b <- rcap[2,1]

  scale_with <- function(k)
  {
    (1 - exp(a)) * (x1[1] - (b/a) + (b/(a^2)) ) * (exp(-a * (k-1))) + (b/a)
  }
  forecast1 <- scale_with(2:n)

  x0cap <- c(x0[1],forecast1)

  A <- 4

  x0cap4 <- scale_with(1 : n+A)

  x0cap5 <- tail(x0cap4,A)

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}


# Model 3 - NGM (1, 1, k, c) model: Nonlinear grey model

ngm11kc <- function(x0){

  # Input data x0

  # AGO
  x1 <- cumsum(x0)

  n <- length(x0)

  # Create matrix y
  y <- matrix(c(x0),ncol=1)
  y <- t(t(x0[2:n]))

  b <- numeric(n)
  for (i in 1:n){
    b[i] <- -0.5*(x1[i+1] + x1[i])
    b1 <- b[1:n-1]
  }

  # Create matrix B2
  mat1 <- matrix(c(b1),ncol=1)
  mat2 <-matrix(2:n, nrow=n-1,ncol=1)
  mat3 <- matrix(1,nrow=n-1,ncol=1)

  B2 <- cbind(mat1, mat2, mat3)

  # Parameters estimation by OLS
  rcap <- (solve (t(B2) %*% B2)) %*% t(B2) %*% y
  a <- rcap[1,1]
  b <- rcap[2,1]
  c <- rcap[3,1]

  scale_with <- function(k)
  {
    (x1[1] - (b/a) + (b/(a^2)) - (c/a)) * (1- exp(a)) * exp(-a*k) + (b/a)
  }
  forecast1 <- scale_with(1:n)

  x0cap <- c(x0[1],forecast1[1:n-1])

  A <- 4

  x0cap4 <- scale_with(1 : n+A-1 )

  x0cap5 <- tail(x0cap4,A)

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}


# Model 4 - ONGM (1, 1, k, c) model: Nonlinear grey model

ongm11kc <- function(x0){

  # Input data x0

  # AGO
  x1 <- cumsum(x0)

  tm <- length(x0)

  # Create matrix y
  y <- matrix(c(x0),ncol=1)
  y <- t(t(x0[2:tm]))

  b <- numeric(tm)
  for (i in 1:tm){
    b[i] <- -0.5*(x1[i+1] + x1[i])
  }
  b1 <- b[1:tm-1]

  # Create matrix B2
  mat1 <- matrix(c(b1),ncol=1)
  mat2 <-matrix(2:tm, nrow=tm-1,ncol=1)
  mat3 <- matrix(1,nrow=tm-1,ncol=1)

  B2 <- cbind(mat1, mat2, mat3)

  # Parameters estimation by OLS
  rcap <- (solve (t(B2) %*% B2)) %*% t(B2) %*% y
  a <- rcap[1,1]
  b <- rcap[2,1]
  c <- rcap[3,1]

  m <- log ((2+a)/(2-a))
  n <- (m*b)/a
  p <- (m*c)/a - (n/a) + (n/2) + (n/m)

  scale_with <- function(k)
  {
    (1-exp(a))*(x1[1]-(n/m)+(n/(m^2))-(p/m))*exp(-m*(k-1))+(n/m)
  }
  forecast1 <- scale_with(2:tm)

  x0cap <- c(x0[1],forecast1)

  A <- 4

  x0cap4 <- scale_with(1 : tm+A )

  x0cap5 <- tail(x0cap4,A)

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}



