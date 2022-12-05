# R code for GM (1, 1) model


#' A function
#'
#' @param x0 is the original sequence
#'
#' @return
#' @importFrom utils tail
#' @export

# Fitted values

gm11 <- function(x0) {

  # x0 is the original data sequence

  # Calculate AGO
  x1 <- cumsum(x0)

  # Determine length of x0
  n <- length(x0)

  # Generate background value sequence Z
  b <- numeric(n)

  for (i in 1:n){
    b[i] <- -(0.5*x1[i + 1] + 0.5*x1[i])
  }

  b1 <- b[1:n-1]

  # Create a matrix B
  B <- matrix(1,nrow=n-1,ncol=2)
  B[,1] <- t(t(b1[1:n-1]))

  # Create matrix yn
  yn <- matrix(c(x0),ncol=1)
  yn <- t(t(x0[2:n]))

  # Estimate parameters a and b by ordinary least squares method (OLS)
  xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
  a <- xcap[1,1]
  b <- xcap[2,1]

  # Calculate fitted values
  scale_with <- function(k)
  {
    (x0[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
  }
  fitted <- scale_with(1:n)
  x0cap <- c(x0[1],fitted[1:n-1])

  # A is the number of forecast values
  A <- 4

  # Predicted values
  x0cap4 <- scale_with(1 : n+A-1)
  x0cap5 <- tail(x0cap4,A)

  # Fitted and predicted values
  x0cap2 <- c(x0cap,x0cap5)

  return(x0cap2)

}



# Improved background values

# Model 1 - EPGM (1, 1) model: Extrapolation-based grey model

epgm11 <- function(x0) {

  # Input data x0

  # Calculate AGO
  x1 <- cumsum(x0)

  n <- length(x0)
  b <- numeric(n)

  # New formula for calculating the background value Z
  for (i in 2:n){
    b[i] <- x1[i] + (0.5 * x0[i])
  }
  b1 <- b[2:n]
  b2 <- -b1

  # Create matrix B
  B <- matrix(1,nrow=n-1,ncol=2)
  B[,1] <- t(t(b2[1:n-1]))

  # Create matrix yn
  yn <- matrix(c(x0),ncol=1)
  yn <- t(t(x0[2:n]))

  # Estimate parameters a and b by ordinary least squares method (OLS)
  xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
  a <- xcap[1,1]
  b <- xcap[2,1]

  # Time response sequence
  scale_with <- function(k)
  {
    (x0[1] - (b/a)) * exp(-a*k) + (b/a)
  }
  x1cap <- scale_with(1:n)

  x0cap1 <- numeric(n)

  # Fitted values
  for (i in 1:n){
    x0cap1[i] <- x1cap[i+1] - x1cap[i]
  }
  x0cap <- c(x0[1],x0cap1[1:n-1])

  # A is the number of forecast values
  A <- 4

  x1cap4 <- scale_with(1 : n+A )
  t4 <- length(x1cap4)
  x0cap4 <- numeric(t4)

  # Predicted values
  for (i in 1:t4-1) {
    x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
  }
  x0cap4 <- c(x0[1],x0cap4[1:t4-1])
  x0cap5 <- tail(x0cap4,A)

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}


# Model 2 - TBGM (1, 1) model: Data transformation-based grey model

tbgm11 <- function(x0) {

  # Input x0

  nn <- length(x0)

  # Take log of x0
  x01 <- log(x0)

  # Add constant c in front of x01, c = 1
  x02 <- c(1, x01)

  # Calculate AGO
  x1 <- cumsum(x02)

  n <- length(x02)

  # Calculation of background values
  b <- replicate(n,0)
  for (i in 1:n){
    b[i] <- -((x1[i+1]-x1[i])/( log(x1[i+1]-x1[1]) - log(x1[i]) ) - ( x1[1]*x1[i] / (x02[i+1]-x02[1]) ) )
  }
  b1 <- b[1:n-1]

  # Create matrix B
  B <- matrix(1,nrow=n-1,ncol=2)
  B[,1] <- t(t(b1[1:n-1]))

  # Create matrix yn
  yn <- matrix(c(x02),ncol=1)
  yn <- t(t(x02[2:n]))

  # Parameters estimation by OLS
  xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
  a <- xcap[1,1]
  b <- xcap[2,1]

  m <- length(x0)

  # Calculate fitted values
  scale_with <- function(k)
  {
    (x02[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
  }
  forecast <- scale_with(2:m)
  x0cap1 <- c(forecast)
  x03cap <- exp(x0cap1)
  x0cap <- c(x0[1],x03cap[1:m-1])


  # A is the numbers of predicted values
  A <- 4

  # Calculate predicted values
  x1cap4 <- scale_with(1 : m +A )
  x0cap44 <- exp(x1cap4)
  x0cap4 <- c(x0cap44[1:m])
  x0cap5 <- tail(x0cap4,A)

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5 )
  return(x0cap2)

}


# Model 3 - IGM (1, 1) model: Improved grey model

igm11 <- function(x0) {

  # Input data x0

  # Calculate AGO
  x1 <- cumsum(x0)

  # n is the length of sequence x0
  n <- length(x0)

  # Calculate background values
  b <- numeric(n)
  for (i in 2:n){
    b[i] <- -(( (x1[i]-x1[i-1]) / ( log(x0[i])-log(x0[i-1]) ) ) + x1[i] - (x0[i]^2 / (x0[i]-x0[i-1]) ))
  }
  b1 <- b[2:n]

  # Generate matrix B
  B <- matrix(1,nrow=n-1,ncol=2)
  B[,1] <- t(t(b1[1:n-1]))

  # Generate matrix yn
  yn <- matrix(c(x0),ncol=1)
  yn <- t(t(x0[2:n]))

  # Parameters estimation by OLS
  xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
  a <- xcap[1,1]
  b <- xcap[2,1]

  # Time response sequence x1cap
  scale_with <- function(k)
  {
    (x0[1] - (b/a)) * exp(-a*(k-1)) + (b/a)
  }
  forecast <- scale_with(1:n)
  x1cap <- c(forecast)

  # Calculate restored values x0cap (Fitted values)
  x0cap <- numeric(n)
  for (i in 1:n-1){
    x0cap[i] <- x1cap[i+1] - x1cap[i]
  }
  x0cap1 <- c(x0[1],x0cap[1:n-1])

  # Number of values to forecast
  A <- 4

  # Calculate predicted values
  x1cap4 <- scale_with(1 : n+A )
  t4 <- length(x1cap4)
  x0cap4 <- numeric(t4-1)
  for (i in 1:t4-1) {
    x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
  }
  x0cap4 <- c(x0cap4[1:t4-1])
  x0cap5 <- tail(x0cap4,A)

  # Fitted & Predicted values
  x0cap2 <- c(x0cap1,x0cap5)
  return(x0cap2)

}


# Model 4 - GM (1, 1, 4) model: Grey model with single variable, one first-order variable and four background values

gm114 <- function(x0) {

  # Input original sequence x0

  # Calculate AGO
  x1 <- cumsum(x0)

  n <- length(x0)

  # Calculate background values
  b <- numeric(n)
  for (i in 4:n){
    b[i] <- -0.25 * (x1[i] + x1[i-1] + x1[i-2] + x1[i-3] )
  }
  b1 <- b[4:n]

  # Generate matrix B
  mat1 <- matrix(c(b1),ncol=1)
  mat2 <- matrix(4:n,ncol=1)
  mat3 <- matrix(1,nrow=n-3, ncol=1)
  B <- cbind(mat1, mat2, mat3)

  # Generate matrix y
  y <- matrix(c(x0),ncol=1)
  y <- t(t(x0[4:n]))

  # Estimate values of a and b by OLS
  xcap <- solve (t(B) %*% B) %*% t(B) %*% y
  a <- xcap[1,1]
  b <- xcap[2,1]
  c <- xcap[3,1]

  # Calculate time response sequence x1cap
  matrix2 <- matrix("",1,n)
  matrix2 <- as.numeric(matrix2)
  matrix2[1] <- x1[1]
  matrix2[2] <- x1[2]
  matrix2[3] <- x1[3]
  for (i in 4:length(matrix2)) {
    matrix2[i] <- ((4-a)/(4+a) * matrix2[i-1]) - ( a/(4+a) * matrix2[i-2]) - ( a/(4+a) * matrix2[i-3]) + ((4*b)/(4+a) * i) + (4*c)/(4+a)
  }
  x1cap <- matrix2

  # Calculate fitted values x0cap (restored values by IAGO)
  x0cap1 <- numeric(n)
  for (i in 1:n){
    x0cap1[i] <- x1cap[i+1] - x1cap[i]
  }
  x0cap <- c(x0[1],x0cap1[1:n-1])

  # A is the number of values to forecast
  A <- 4

  n <- length(x0)

  # Compute predicted values
  nn <- n + A
  matrix2A <- matrix("",1,nn)
  matrix2A <- as.numeric(matrix2A)
  matrix2A[1] <- x1[1]
  matrix2A[2] <- x1[2]
  matrix2A[3] <- x1[3]
  for (i in 4:length(matrix2A)) {
    matrix2A[i] <- ((4-a)/(4+a) * matrix2A[i-1]) - ( a/(4+a) * matrix2A[i-2]) - ( a/(4+a) * matrix2A[i-3]) + ((4*b)/(4+a) * i) + (4*c)/(4+a)
  }

  x1capA <- matrix2A
  x0cap1A <- numeric(nn)
  for (i in 1:nn){
    x0cap1A[i] <- x1capA[i+1] - x1capA[i]
  }
  x0cap4 <- c(x0[1],x0cap1A[1:nn-1])
  x0cap5 <- tail(x0cap4,A)

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}
