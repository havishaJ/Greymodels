# Combined models


#' A function
#'
#' @param x0 is the original sequence
#'
#' @return
#' @importFrom stats lm
#' @import particle.swarm.optimisation
#' @export

# Model 1 - NGBM (1, 1) model: Non-linear grey Bernoulli model

ngbm11 <- function(x0){

  # Input data x0

  # Optimize p value

  p <- seq(-1,0.999,by=0.001)

  set_p <- data.frame(p)

  fitness <- function(set_p)
  {
    p <- set_p[1]

    # AGO
    x1 <- cumsum(x0)

    n <- length(x0)

    b <- numeric(n)
    for (i in 1:n){
      b[i] <- -(0.5*x1[i + 1] + (1-0.5)*x1[i])
    }
    b1 <- b[1:n-1]

    mat1 <- matrix(c(b1),ncol=1)
    b2 <- -b1

    c <- numeric(n)
    for (i in 1:n){
      c[i] <- b2[i]^p
    }
    c1 <- c[1:n-1]

    mat2 <- matrix(c(c1), ncol = 1)

    B <- cbind(mat1,mat2)
    B[,1] <- t(t(b1[1:n-1]))

    yn <- matrix(c(x0),ncol=1)
    yn <- t(t(x0[2:n]))

    xcap <- solve (t(B) %*% B,tol = 1e-20) %*% t(B) %*% yn
    a <- xcap[1,1]
    b <- xcap[2,1]

    scale_with <- function(k)
    {
      ((x0[1]^(1-p) -(b/a)) * exp(-a*(1-p)*k) + (b/a)) ^ (1/(1-p))
    }
    forecast <- scale_with(0:n)

    x1cap <- c(forecast)

    x0cap <- numeric(n)
    for (i in 1:n){
      x0cap[i] <- x1cap[i+1] - x1cap[i]
    }
    x0cap1 <- x0cap[1:n-1]

    particule_result <- c(x0[1],x0cap1)
    fitness <- (1/n)*sum(abs((x0-particule_result)/x0)*100, na.rm=TRUE)
    return(fitness)
  }

  mape_values <- apply(set_p, 1, FUN = 'fitness')
  fitness_matrix <- matrix(c(mape_values),ncol=1)
  min_error <- which(mape_values == min(mape_values), arr.ind = TRUE)
  opt_values <- set_p[min_error,]

  # NGBM model with optimized p

  # AGO
  x1 <- cumsum(x0)

  n <- length(x0)

  b <- numeric(n)
  for (i in 1:n){
    b[i] <- -(0.5*x1[i + 1] + (1-0.5)*x1[i])
  }
  b1 <- b[1:n-1]

  mat1 <- matrix(c(b1),ncol=1)

  b2 <- -b1

  c <- numeric(n)
  for (i in 1:n){
    c[i] <- b2[i]^(opt_values)
  }
  c1 <- c[1:n-1]

  mat2 <- matrix(c(c1), ncol = 1)

  B <- cbind(mat1,mat2)

  B[,1] <- t(t(b1[1:n-1]))

  yn <- matrix(c(x0),ncol=1)
  yn <- t(t(x0[2:n]))

  xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
  a <- xcap[1,1]
  b <- xcap[2,1]

  scale_with <- function(k,opt_values)
  {
    ((x0[1]^(1-opt_values) -(b/a)) * exp(-a*(1-opt_values)*k) + (b/a)) ^ (1/(1-opt_values))
  }
  forecast <- scale_with(0:n, opt_values)

  x1cap <- c(forecast)

  x0cap <- numeric(n)
  for (i in 1:n){
    x0cap[i] <- x1cap[i+1] - x1cap[i]
  }
  x0cap1 <- x0cap[1:n-1]

  x0cap <- c(x0[1],x0cap1)

  A <- 4

  x1cap4 <- scale_with(1 : n+A-1, opt_values )

  t4 <- length(x1cap4)

  x0cap4 <- numeric(t4)
  for (i in 1:t4-1) {
    x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
  }
  x0cap4 <- c(x0[1],x0cap4[1:t4-1])

  x0cap5 <- tail(x0cap4,A)

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}



# Model 2 - GGVM (1, 1) model: Grey generalized Verhulst model

ggvm11 <- function(x0){

  # Input data x0

  # AGO
  x1 <- cumsum(x0)

  n <- length(x0)

  y <- matrix(c(x0),ncol=1)
  y <- t(t(x0[2:n]))

  b <- numeric(n)
  for (i in 1:n){
    b[i] <- -0.5*(x1[i+1] + x1[i])
  }
  b1 <- b[1:n-1]

  mat1 <- matrix(c(b1),ncol=1)

  c <- numeric(n)
  for (i in 1:n){
    c[i] <- (b1[i])^2
  }
  c1 <- c[1:n-1]

  mat2 <-matrix(c(c1),ncol=1)
  mat3 <- matrix(1,nrow=n-1,ncol=1)
  B <- cbind(mat1, mat2, mat3)

  Bcap <- (solve (t(B) %*% B)) %*% t(B) %*% y
  alpha <- Bcap[1,1]
  beta <- Bcap[2,1]

  miu <- Bcap[3,1]
  alpha2 <- alpha^2
  lambda <- sqrt( alpha2 - (4*beta*miu) )
  v <- (2*beta*x0[1] - alpha - lambda)
  w <- (2*beta*x0[1] - alpha + lambda)
  phi1 <- abs(v/w)
  phi <- 1 - (  ((1/lambda)*log(phi1)) )

  scale_with <- function(k)
  {
    alpha/(2*beta) - ((lambda/(2*beta))*( 1 - (2/(exp(lambda*(k-phi))+1))))
  }
  forecast <- scale_with(1:n)

  x1cap <- c(forecast)

  x0cap1 <- numeric(n)
  for (i in 1:n){
    x0cap1[i] <- x1cap[i+1] - x1cap[i]
  }
  x0cap <- c(x0[1],x0cap1[1:n-1])

  A <- 4

  x1cap4 <- scale_with(1 : n+A )

  t4 <- length(x1cap4)

  x0cap4 <- numeric(t4)
  for (i in 1:t4-1) {
    x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
  }
  x0cap4 <- c(x0[1],x0cap4[1:t4-1])

  x0cap5 <- tail(x0cap4,A)

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}


# Model 3 - TFDGM (1, 1) model: Traffic flow mechanics grey model

tfdgm11 <- function(x0){

  # Input data x0

  # AGO
  x1 <- cumsum(x0)

  n <- length(x0)

  z <- numeric(n)
  for (i in 1:n){
    z[i] <- 0.5*(x1[i+1] + x1[i])
  }
  z1 <- z[1:n-1]

  mat2 <- matrix(c(z1),ncol=1)

  for (i in 1:n){
    z[i] <- (0.5*(x1[i+1] + x1[i]))^2
  }
  z2 <- z[1:n-1]

  mat1 <- matrix(c(z2),ncol=1)
  mat3 <- matrix(1,nrow=n-1,ncol=1)

  B <- cbind(mat1, mat2, mat3)

  y <- matrix(c(x0),ncol=1)
  y <- t(t(x0[2:n]))

  pcap <- (solve (t(B) %*% B)) %*% t(B) %*% y
  a <- pcap[1,1]
  b <- pcap[2,1]
  lambda <- pcap[3,1]

  p <- b/(2*a)
  q <- ((b^2)/(4*(a^2))) - (lambda/a)

  forecast <- numeric(n)
  for (k in 1:n){
    if (q == 0){
      C2 <- (-1 / (x0[1] + p)) - a
      forecast[k] <-  ( -1 / ((a*k) + C2) ) - p
    } else if (q < 0) {
      c3 <- (1/sqrt(-q)) * atan( (x0[1]+p) / sqrt(-q) ) - a
      forecast[k] <-  sqrt(-q)* tan( sqrt(-q) * ( (a*k) + c3 ) ) - p
    }
  }
  x1cap <- c(forecast)

  x0cap <- numeric(n)
  for (i in 1:n){
    x0cap[i] <- x1cap[i+1] - x1cap[i]
  }
  x0cap1 <- x0cap[1:n-1]
  x0cap <- c(x0[1],x0cap1)

  A <- 4

  forecasta <- numeric(n)
  for (k in 1:n+A){
    if (q == 0){
      C2 <- (-1 / (x0[1] + p)) - a
      forecast[k] <-  ( -1 / ((a*k) + C2) ) - p
    } else if (q < 0) {
      c3 <- (1/sqrt(-q)) * atan( (x0[1]+p) / sqrt(-q) ) - a
      forecasta[k] <-  sqrt(-q)* tan( sqrt(-q) * ( (a*k) + c3 ) ) - p
    }
  }
  x1cap4 <- c(forecasta)

  t4 <- length(x1cap4)

  x0cap4 <- numeric(t4)
  for (i in 1:t4-1) {
    x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
  }
  x0cap4 <- c(x0[1],x0cap4[1:t4-1])

  x0cap5 <- tail(x0cap4,A)

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}
