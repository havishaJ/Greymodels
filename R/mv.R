# Multivariate Grey models

#' A function
#'
#' @param x1,x2,x3
#' @param x01,x02
#'
#' @return
#' @import expm
#' @importFrom dplyr slice_tail
#' @export


# Model 1 - GM (1, 3) model: Grey multivariate model with first order differential equation and 3 variables.

gm13 <- function(x1,x2,x3){

  # Input data - 3 variables
  # x1 - variable 1
  # x1 - variable 2
  # x1 - variable 3

  # AGO
  x1_1 <- cumsum(x1)
  x2_1 <- cumsum(x2)
  x3_1 <- cumsum(x3)

  n <- length(x1)

  z <- numeric(n)
  for (i in 1:n){
    z[i] <- -0.5*(x1_1[i + 1] + x1_1[i])
  }
  z1 <- z[1:n-1]

  # Create matrix y
  y <- matrix(c(x1),ncol=1)
  y <- t(t(x1[2:n]))

  # Create matrix B
  mat1 <- matrix(c(z1),ncol=1)
  mat2 <- matrix(c(x2_1),ncol=1)
  mat2 <- t(t(x2_1[2:n]))
  mat3 <- matrix(c(x3_1),ncol=1)
  mat3 <- t(t(x3_1[2:n]))

  B <- cbind(mat1, mat2, mat3)

  # Parameters estimation
  acap <- (solve (t(B) %*% B)) %*% t(B) %*% y
  a1 <- acap[1,1]
  b2 <- acap[2,1]
  b3 <- acap[3,1]

  # From GM(1,1) for x2
  b_x2 <- numeric(n)
  for (i in 1:n){
    b_x2[i] <- -(0.5*x2_1[i + 1] + 0.5*x2_1[i])
  }
  b1_x2 <- b_x2[1:n-1]
  B_x2 <- matrix(1,nrow=n-1,ncol=2)
  B_x2[,1] <- t(t(b1_x2[1:n-1]))
  yn_x2 <- matrix(c(x2),ncol=1)
  yn_x2 <- t(t(x2[2:n]))
  xcap_x2 <- solve (t(B_x2) %*% B_x2) %*% t(B_x2) %*% yn_x2
  a2 <- xcap_x2[1,1]
  c2 <- xcap_x2[2,1]
  #' GM (1,1) for x3
  x1_x3 <- cumsum(x3)
  n_x3 <- length(x3)
  b_x3 <- numeric(n_x3)
  for (i in 1:n){
    b_x3[i] <- -(0.5*x3_1[i + 1] + 0.5*x3_1[i])
  }
  b1_x3 <- b_x3[1:n-1]

  B_x3 <- matrix(1,nrow=n-1,ncol=2)

  B_x3[,1] <- t(t(b1_x3[1:n-1]))

  yn_x3 <- matrix(c(x3),ncol=1)
  yn_x3 <- t(t(x3[2:n]))

  xcap_x3 <- solve (t(B_x3) %*% B_x3) %*% t(B_x3) %*% yn_x3
  a3 <- xcap_x3[1,1]
  c3 <- xcap_x3[2,1]

  m <- length(y)

  constant <-  ( ( b2*c2 )/a2 + ( b3*c3 )/a3 ) / a1
  f_a2 <- ( ( ( b2 * exp(a2) ) * ( x2[1] - (c2/a2) ) ) / (a1 - a2) )
  f_a3 <- ( ( ( b3 * exp(a3) ) * ( x3[1] - (c3/a3) ) ) / (a1 - a3) )
  f_a1 <- ( exp(a1) * ( x1[1] - (f_a2 * exp(-a2)) ) ) +
    ( exp(a1) * ( x1[1] - (f_a3 * exp(-a3)) ) )

  t0 <- 1
  # formula says - constant
  ff <-  exp(a1*t0) *( x1[1] + constant )

  # formula says + ff
  total <- f_a1 - ff

  scale_with <- function(t)
  {
    ( total*exp(-a1*t) ) +  ( f_a2*exp(-a2*t) ) +  ( f_a3*exp(-a3*t) ) + constant
  }
  forecast <- scale_with(2:n)

  x1cap <- c(x1[1],forecast)

  x0cap1 <- numeric(n)
  for (i in 1:n-1){
    x0cap1[i] <- x1cap[i+1] - x1cap[i]
  }
  x0cap <- c(x1[1],x0cap1[1:n-1])

  A <- 4

  x1cap4 <- scale_with(1 : n+A )

  t4 <- length(x1cap4)

  x0cap4 <- numeric(t4-1)

  for (i in 1:t4-1) {
    x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
  }
  x0cap4 <- c(x0cap4[1:t4-1])

  x0cap5 <- tail(x0cap4,A)

  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}



# Model 2 - IGM (1, 3) model: Improved grey multivariate model with first order differential equation
# and 3 variables.

igm13 <- function(x1,x2,x3){

  # Input data - 3 variables
  # x1 - variable 1
  # x1 - variable 2
  # x1 - variable 3

  x1_1 <- cumsum(x1)
  x2_1 <- cumsum(x2)
  x3_1 <- cumsum(x3)

  n <- length(x1)

  z <- numeric(n)

  alpha <- 0.5
  for (i in 1:n){
    z[i] <- -alpha*x1_1[i] - ((1-alpha)*x1_1[i+1])
  }
  z1 <- z[1:n-1]

  mat1 <- matrix(c(z1),ncol=1)

  v <- numeric(n)

  alpha <- 0.5
  for (i in 1:n){
    v[i] <- alpha*x2_1[i] + ((1-alpha)*x2_1[i+1])
  }
  v1 <- v[1:n-1]

  mat2 <- matrix(c(v1),ncol=1)

  w <- numeric(n)

  alpha <- 0.5
  for (i in 1:n){
    w[i] <- alpha*x3_1[i] + ((1-alpha)*x3_1[i+1])
  }
  w1 <- w[1:n-1]

  mat3 <- matrix(c(w1),ncol=1)
  mat4 <- matrix(1,nrow=n-1, ncol=1)

  y <- matrix(c(x1),ncol=1)
  y <- t(t(x1[2:n]))

  B <- cbind(mat1, mat2, mat3, mat4)

  Bcap <- (solve (t(B) %*% B)) %*% t(B) %*% y
  a1 <- Bcap[1,1]
  b2 <- Bcap[2,1]
  b3 <- Bcap[3,1]
  b <- Bcap[4,1]

  # From GM(1,1) for x2
  b_x2 <- numeric(n)
  for (i in 1:n){
    b_x2[i] <- -(0.5*x2_1[i + 1] + 0.5*x2_1[i])
  }
  b1_x2 <- b_x2[1:n-1]

  B_x2 <- matrix(1,nrow=n-1,ncol=2)
  B_x2[,1] <- t(t(b1_x2[1:n-1]))

  yn_x2 <- matrix(c(x2),ncol=1)
  yn_x2 <- t(t(x2[2:n]))

  xcap_x2 <- solve (t(B_x2) %*% B_x2) %*% t(B_x2) %*% yn_x2
  a2 <- xcap_x2[1,1]
  c2 <- xcap_x2[2,1]

  #' GM (1,1) for x3
  x1_x3 <- cumsum(x3)

  n_x3 <- length(x3)

  b_x3 <- numeric(n_x3)
  for (i in 1:n){
    b_x3[i] <- -(0.5*x3_1[i + 1] + 0.5*x3_1[i])
  }
  b1_x3 <- b_x3[1:n-1]
  B_x3 <- matrix(1,nrow=n-1,ncol=2)

  B_x3[,1] <- t(t(b1_x3[1:n-1]))

  yn_x3 <- matrix(c(x3),ncol=1)
  yn_x3 <- t(t(x3[2:n]))

  xcap_x3 <- solve (t(B_x3) %*% B_x3) %*% t(B_x3) %*% yn_x3
  a3 <- xcap_x3[1,1]
  c3 <- xcap_x3[2,1]

  m <- length(y)

  constant <-  ( ( b2*c2 )/a2 + ( b3*c3 )/a3 + b ) / a1
  f_a2 <- ( ( ( b2 * exp(a2) ) * ( x2[1] - (c2/a2) ) ) / (a1 - a2) )
  f_a3 <- ( ( ( b3 * exp(a3) ) * ( x3[1] - (c3/a3) ) ) / (a1 - a3) )
  f_a1 <- ( exp(a1) * ( x1[1] - ( ( ( ( b2*exp(a2) ) * ( x2[1] - (c2/a2) ) ) /( a1 - a2 ) ) * exp(-a2) ) ) ) +
    ( exp(a1) * ( x1[1] - ( ( ( ( b3*exp(a3) ) * ( x3[1] - (c3/a3) ) ) /( a1 - a3 ) ) * exp(-a3) ) ) )

  t0 <- 1

  ff <-  exp(a1*t0) *( x1[1] + constant )
  total <- f_a1 - ff

  scale_with <- function(t)
  {
    ( total*exp(-a1*t) ) +  ( f_a2*exp(-a2*t) ) +  ( f_a3*exp(-a3*t) ) + constant
  }
  forecast <- scale_with(2:n)

  x1cap <- c(x1[1],forecast)

  x0cap1 <- numeric(n)
  for (i in 1:n-1){
    x0cap1[i] <- x1cap[i+1] - x1cap[i]
  }
  x0cap <- c(x1[1],x0cap1[1:n-1])

  A <- 4

  x1cap4 <- scale_with(1 : n+A )

  t4 <- length(x1cap4)

  x0cap4 <- numeric(t4-1)
  for (i in 1:t4-1) {
    x0cap4[i] <- x1cap4[i+1] - x1cap4[i]
  }
  x0cap4 <- c(x0cap4[1:t4-1])

  x0cap5 <- tail(x0cap4,A)

  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)
}


# Model 3 - NHMGM_1 (1, 2) model: Non-homogeneous multivariate grey model with first order differential equation
# and 2 variables.


nhmgm1 <- function(x01,x02){

  x11 <- cumsum(x01)
  x12 <- cumsum(x02)

  p <- 1

  n <- length(x01)

  z1 <- numeric(n)
  for (i in 1:n){
    z1[i] <- 0.5*(x11[i + 1] + x11[i])
  }
  z11 <- z1[1:n-1]

  mat1 <- matrix(c(z11),ncol=1)
  z2 <- numeric(n)
  for (i in 1:n){
    z2[i] <- 0.5*(x12[i + 1] + x12[i])
  }
  z12 <- z2[1:n-1]

  mat2 <- matrix(c(z12),ncol=1)

  b <- numeric(n)
  for (i in 2:n){
    b[i] <- i^p
  }

  mat3 <- matrix(c(b[2:n]),ncol=1)
  mat4 <- matrix(1,nrow=n-1,ncol=1)

  B <- cbind(mat1,mat2,mat3,mat4)

  N <- matrix(c(x01[2:n],x02[2:n]),ncol=2)

  xcap <- solve (t(B) %*% B) %*% t(B) %*% N

  R <- t(xcap[1:2,])

  Rinv <- solve(R)
  R2 <- Rinv %^% 2
  R3 <- Rinv %^% 3

  alpha <- matrix(xcap[3,], nrow=2)

  beta <- matrix(xcap[4,],nrow=2)

  ab <- alpha + beta

  x <- matrix(c(x01[1],x02[1]),ncol=1)
  vec <- c(2:n)
  forecast2 <- function(i) {
    ( expm(((i-1) * R)) - expm(((i-2)* R)) ) %*% ( x + ( Rinv %*% ab ) + (  R2 %*% alpha ) ) - (Rinv %*% alpha)

  }
  fitted <- sapply(vec,forecast2)

  x0cap <- matrix(c(x,fitted),nrow=2)

  fitted_1 <- t(x0cap[1,])
  fitted_2 <- t(x0cap[2,])

  x0cap <- matrix(c(fitted_1,fitted_2),ncol=2)

  A <- 4

  vecA <- c(2:n+A)
  forecast2A <- function(i) {
    ( expm(((i-1) * R)) - expm(((i-2)* R)) ) %*% ( x + ( Rinv %*% ab ) + (  R2 %*% alpha ) ) - (Rinv %*% alpha)

  }

  fitted_A <- sapply(vecA,forecast2A)

  x0cap4 <- t(fitted_A)

  x0cap5f <- tail(x0cap4,A)

  forecast_1 <- c(x0cap5f[,1])
  forecast_2 <- c(x0cap5f[,2])

  x0cap5 <- matrix(c(forecast_1,forecast_2),ncol=2)

  x0cap2_x1 <- c(fitted_1,forecast_1 )
  x0cap2_x2 <- c(fitted_2,forecast_2 )

  x0cap2 <- matrix(c(x0cap2_x1,x0cap2_x2),ncol=2)

  colnames(x0cap2, do.NULL = FALSE)
  colnames(x0cap2) <- c("Fitted-Sequence 1","Fitted-Sequence 2")
  return(x0cap2)

}



# Model 4 - NHMGM_2 (1, 2) model: Non-homogeneous multivariate grey model with first order differential equation
# and 2 variables.

nhmgm2 <- function(x01,x02){

  x11 <- cumsum(x01)
  x12 <- cumsum(x02)

  n <- length(x01)

  z1 <- numeric(n)

  for (i in 1:n){
    z1[i] <- 0.5*(x11[i + 1] + x11[i])
  }
  z11 <- z1[1:n-1]
  mat1 <- matrix(c(z11),ncol=1)

  z2 <- numeric(n)
  for (i in 1:n){
    z2[i] <- 0.5*(x12[i + 1] + x12[i])
  }
  z12 <- z2[1:n-1]

  mat2 <- matrix(c(z12),ncol=1)

  p <- 2

  b <- numeric(n)
  for (i in 2:n){
    b[i] <- i^p
  }

  mat3 <- matrix(c(b[2:n]),ncol=1)
  mat4 <- matrix(1,nrow=n-1,ncol=1)

  B <- cbind(mat1,mat2,mat3,mat4)

  N <- matrix(c(x01[2:n],x02[2:n]),ncol=2)

  xcap <- solve (t(B) %*% B) %*% t(B) %*% N

  R <- t(xcap[1:2,])
  Rinv <- solve(R)
  R2 <- Rinv %^% 2
  R3 <- Rinv %^% 3

  alpha <- matrix(xcap[3,], nrow=2)
  beta <- matrix(xcap[4,],nrow=2)
  ab <- alpha + beta

  x <- matrix(c(x01[1],x02[1]),ncol=1)

  vec <- c(2:n)
  forecast2 <- function(i) {
    ( expm(((i-1) * R)) - expm(((i-2)* R)) ) %*% ( x + ( Rinv %*% ab ) + (  2* R2 %*% alpha ) + (  2* R3 %*% alpha ) ) - ( 2 * i * Rinv %*% alpha) + (Rinv %*% alpha)
  }
  sapply(vec,forecast2)

  fitted <- sapply(vec,forecast2)

  x0cap <- matrix(c(x,fitted),nrow=2)

  fitted_1 <- t(x0cap[1,])
  fitted_2 <- t(x0cap[2,])

  x0cap <- matrix(c(fitted_1,fitted_2),ncol=2)

  A <- 4

  vecA <- c(2:n+A)
  forecast2A <- function(i) {
    ( expm(((i-1) * R)) - expm(((i-2)* R)) ) %*% ( x + ( Rinv %*% ab ) + (  2* R2 %*% alpha ) + (  2* R3 %*% alpha ) ) - ( 2 * i * Rinv %*% alpha) + (Rinv %*% alpha)

  }
  fitted_A <- sapply(vecA,forecast2A)

  x0cap4 <- t(fitted_A)

  x0cap5f <- tail(x0cap4,A)

  forecast_1 <- c(x0cap5f[,1])
  forecast_2 <- c(x0cap5f[,2])

  x0cap5 <- matrix(c(forecast_1,forecast_2),ncol=2)

  x0cap2_x1 <- c(fitted_1,forecast_1 )
  x0cap2_x2 <- c(fitted_2,forecast_2 )

  x0cap2 <- matrix(c(x0cap2_x1,x0cap2_x2),ncol=2)
  colnames(x0cap2, do.NULL = FALSE)
  colnames(x0cap2) <- c("Fitted-Sequence 1","Fitted-Sequence 2")
  return(x0cap2)

}



# Model 5 - GMC_g (1, 2) model: Multivariate grey convolution model with first order differential equation and
# 2 variables using the Gaussian rule.


gmcg12 <- function(x01,x02,dat_a){

  x11 <- cumsum(x01)
  x12 <- cumsum(x02)

  n <- length(x01)

  b11 <- numeric(n)
  b12 <- numeric(n)

  for (i in 1:n){
    b11[i] <- -(0.5*x11[i + 1] + 0.5*x11[i])
    b12[i] <- (0.5*x12[i + 1] + 0.5*x12[i])
  }
  b11a <- b11[1:n-1]
  b12a <- b12[1:n-1]

  mat1 <- matrix(c(b11a),ncol=1)
  mat2 <- matrix(c(b12a),ncol=1)
  mat3 <- matrix(1,nrow=n-1,ncol=1)

  B <- cbind(mat1, mat2, mat3)

  yn <- matrix(c(x01),ncol=1)
  yn <- t(t(x01[2:n]))

  xcap <- solve (t(B) %*% B) %*% t(B) %*% yn

  beta1 <- xcap[1,1]
  beta2 <- xcap[2,1]
  u <- xcap[3,1]

  fe <- numeric(n)
  for (i in 1:n){
    fe[i] <- beta2 * x12[i] + u
  }
  E <- matrix(c(fe[1:n]),ncol =1)
  xrG <- replicate(n,0)
  for (t in 2:n){
    sm <- 0
    for (e in 2:t){
      sm <- sm + (  (exp(-beta1*(t - e + 0.5)))) * ( 0.5 * (E[e]+ E[e-1]) )
    }
    xrG[t] <- ( x01[1]*exp(-beta1*(t-1)) ) + sm
  }
  xcap1G <- c(x01[1],xrG[2:n])
  fG <- numeric(n-1)
  for (i in 1:n-1){
    fG[i] <- (xcap1G[i+1] - xcap1G[i])
  }
  f1G <- fG[1:n-1]
  x0cap <- matrix(c(x01[1],f1G[1:n-1]),ncol=1)

  A <- 4

  newx02 <- as.numeric(unlist(dat_a))
  m <- length(newx02)
  newx12 <- cumsum(newx02)
  fe_A <- numeric(m)
  for (i in 1:m){
    fe_A[i] <- beta2 * newx12[i] + u
  }
  E_A <- matrix(c(fe_A[1:m]),ncol =1)
  xrG_A <- replicate(m,0)
  for (t in 2:m){
    sm <- 0
    for (e in 2:t){
      sm <- sm + (  (exp(-beta1*(t - e + 0.5)))) * ( 0.5 * (E_A[e]+ E_A[e-1]) )
    }
    xrG_A[t] <- ( x01[1]*exp(-beta1*(t-1)) ) + sm
  }
  xcap1G_A <- c(x01[1],xrG_A[2:m])

  fG_A <- numeric(m-1)
  for (i in 1:m-1){
    fG_A[i] <- (xcap1G_A[i+1] - xcap1G_A[i])
  }
  f1G_A <- fG_A[1:m-1]

  x0cap4 <- matrix(c(x01[1],f1G_A[1:m-1]),ncol=1)

  x0cap5 <- tail(x0cap4,A)

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5 )
  return(x0cap2)

}


# Model 6 - GMC (1, 2) model: Multivariate grey convolution model with first order differential equation and
# 2 variables using the trapezoidal rule.


gmc12 <- function(x01,x02,dat_a){

  x11 <- cumsum(x01)
  x12 <- cumsum(x02)

  n <- length(x01)

  b11 <- numeric(n)
  b12 <- numeric(n)
  for (i in 1:n){
    b11[i] <- -(0.5*x11[i + 1] + 0.5*x11[i])
    b12[i] <- (0.5*x12[i + 1] + 0.5*x12[i])
  }
  b11a <- b11[1:n-1]
  b12a <- b12[1:n-1]

  mat1 <- matrix(c(b11a),ncol=1)
  mat2 <- matrix(c(b12a),ncol=1)
  mat3 <- matrix(1,nrow=n-1,ncol=1)

  B <- cbind(mat1, mat2, mat3)

  yn <- matrix(c(x01),ncol=1)
  yn <- t(t(x01[2:n]))

  xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
  beta1 <- xcap[1,1]
  beta2 <- xcap[2,1]
  u <- xcap[3,1]

  fe <- numeric(n)
  for (i in 1:n){
    fe[i] <- beta2 * x12[i] + u
  }
  E <- matrix(c(fe[1:n]),ncol =1)
  xr <- replicate(n,0)
  for (t in 2:n){
    sm <- 0
    for (e in 2:t){
      sm <- sm + ( 0.5 * ( (exp(-beta1*(t - e))*E[e]) + (exp(-beta1*(t-e+1))*E[e-1]) ) )
    }
    xr[t] <- ( x01[1]*exp(-beta1*(t-1)) )+ sm
  }
  xcap1 <- c(x01[1],xr[2:n])

  f <- numeric(n-1)
  for (i in 1:n-1){
    f[i] <- (xcap1[i+1] - xcap1[i])
  }
  f1 <- f[1:n-1]
  x0cap <- matrix(c(x01[1],f1[1:n-1]),ncol=1)

  A <- 4

  newx02 <- as.numeric(unlist(dat_a))

  m <- length(newx02)

  newx12 <- cumsum(newx02)

  fe_A <- numeric(m)
  for (i in 1:m){
    fe_A[i] <- beta2 * newx12[i] + u
  }
  E_A <- matrix(c(fe_A[1:m]),ncol =1)
  xr_A <- replicate(m,0)
  for (t in 2:m){
    sm <- 0
    for (e in 2:t){
      sm <- sm + ( 0.5 * ( (exp(-beta1*(t - e))*E_A[e]) + (exp(-beta1*(t-e+1))*E_A[e-1]) ) )
    }
    xr_A[t] <- ( x01[1]*exp(-beta1*(t-1)) )+ sm
  }
  xcap1_A <- c(x01[1],xr_A[2:m])

  f_A <- numeric(m-1)
  for (i in 1:m-1){
    f_A[i] <- (xcap1_A[i+1] - xcap1_A[i])
    f1_A <- f_A[1:m-1]
  }
  x0cap4 <- matrix(c(x01[1],f1_A[1:m-1]),ncol=1)

  x0cap5 <- tail(x0cap4,A)

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}



# Model 7 - DBGM (1, 2) model: Multivariate grey model with dynamic background value, first order differential equation
# and 2 variables using the Gaussian rule.


dbgm12 <- function(x01,x02,dat_a){

  x11 <- cumsum(x01)
  x12 <- cumsum(x02)

  n <- length(x01)

  fitness_function <- function(value)
  {
    b <- value[1]

    x11 <- cumsum(x01)
    x12 <- cumsum(x02)

    n <- length(x01)

    z1 <- numeric(n-1)
    for (i in 1:n-1){
      z1[i] <- ((b-1)*x11[i])-(b*x11[i + 1])
    }

    mat2 <- matrix(c(z1),ncol=1)
    mat1 <- matrix(c(x12[2:n]),ncol=1)
    mat3 <- matrix(2:n,nrow=n-1,ncol=1)
    mat4 <- matrix(1,nrow=n-1,ncol=1)

    B <- cbind(mat1,mat2,mat3,mat4)

    S <- matrix(c(x01[2:n]),ncol=1)
    xcap <- solve (t(B) %*% B) %*% t(B) %*% S
    #lm(formula = S ~B)
    b2 <- xcap[1,1]
    a <- xcap[2,1]
    c <- xcap[3,1]
    d <- xcap[4,1]

    v1 <- 1/(1 + (a*b))
    v2 <- 1 - ( a/(1 + (a*b)) )
    v3 <- c/(1 + (a*b))
    v4 <- d/(1 + (a*b))

    fun1 <- replicate(n,0)
    for (k in 2:n){
      sm <- 0
      for (u in 2:k-1){
        sm <- sm + (v1 *( v2^(u-1) * b2 * x12[k-u+1] ) )
      }
      fun1[k] <- 1 * sm
    }
    xcap1_1 <- c(fun1[2:n])

    fun2 <- replicate(n,0)
    for (k in 2:n){
      sm <- 0
      for (v in  2:k-2){
        sm <- sm + ( (v2^v) * ( (k-v) * v3 + v4 ) )
      }
      fun2[k] <- 1 * sm
    }
    xcap1_2 <- c(fun2[2:n])

    fun3 <- numeric(n)
    for (k in 2:n){
      fun3[k] <- v2^(k-1) * x01[1]
    }
    xcap1_3 <- fun3[2:n]

    total1 <- xcap1_1 +xcap1_2+xcap1_3

    total <- c(x01[1],total1)

    x0cap1 <- numeric(n)
    for (i in 1:n){
      x0cap1[i] <-total[i+1] - total[i]
    }
    x0cap <- c(x01[1],x0cap1[1:n-1])

    particule_result <- x0cap
    fitness <- -(1/n)*sum(abs((x01-particule_result)/x01)*100, na.rm=TRUE)
    return(fitness)
  }

  values_ranges <- list(c(0.01,0.999))
  swarm <- ParticleSwarm$new(pop_size = 1000,
                             values_names = list("b"),
                             fitness_function = fitness_function,
                             max_it = 100,
                             acceleration_coefficient_range = list(c(0.5,1.5),c(0.5,1.5)),
                             inertia = 0.8,
                             ranges_of_values = values_ranges)
  swarm$run(plot = FALSE,verbose = FALSE,save_file = FALSE)
  swarm

  swarm$swarm_best_values

  opt_b <- swarm$swarm_best_values[1]
  b <- opt_b

  z1 <- numeric(n-1)
  for (i in 1:n-1){
    z1[i] <- ((b-1)*x11[i])-(b*x11[i + 1])
  }

  mat2 <- matrix(c(z1),ncol=1)
  mat1 <- matrix(c(x12[2:n]),ncol=1)
  mat3 <- matrix(2:n,nrow=n-1,ncol=1)
  mat4 <- matrix(1,nrow=n-1,ncol=1)

  B <- cbind(mat1,mat2,mat3,mat4)

  S <- matrix(c(x01[2:n]),ncol=1)

  xcap <- solve (t(B) %*% B) %*% t(B) %*% S
  #lm(formula = S ~B)
  b2 <- xcap[1,1]
  a <- xcap[2,1]
  c <- xcap[3,1]
  d <- xcap[4,1]

  v1 <- 1/(1 + (a*b))
  v2 <- 1 - ( a/(1 + (a*b)) )
  v3 <- c/(1 + (a*b))
  v4 <- d/(1 + (a*b))

  fun1 <- replicate(n,0)
  for (k in 2:n){
    sm <- 0
    for (u in 2:k-1){
      sm <- sm + (v1 *( v2^(u-1) * b2 * x12[k-u+1] ) )
    }
    fun1[k] <- 1 * sm
  }
  xcap1_1 <- c(fun1[2:n])

  fun2 <- replicate(n,0)
  for (k in 2:n){
    sm <- 0
    for (v in  2:k-2){
      sm <- sm + ( (v2^v) * ( (k-v) * v3 + v4 ) )
    }
    fun2[k] <- 1 * sm
  }
  xcap1_2 <- c(fun2[2:n])

  fun3 <- numeric(n)
  for (k in 2:n){
    fun3[k] <- v2^(k-1) * x01[1]
  }
  xcap1_3 <- fun3[2:n]

  total1 <- xcap1_1 +xcap1_2+xcap1_3

  total <- c(x01[1],total1)

  x0cap1 <- numeric(n)

  for (i in 1:n){
    x0cap1[i] <-total[i+1] - total[i]
  }
  x0cap <- c(x01[1],x0cap1[1:n-1])

  A <- 4

  newx02 <- as.numeric(unlist(dat_a))

  newx12 <- cumsum(newx02 )

  fun1A <- replicate(n+A,0)

  for (k in 2:n+A){
    sm <- 0
    for (u in 2:k-1){
      sm <- sm + (v1 *( v2^(u-1) * b2 * newx12[k-u+1] ) )
    }
    fun1A[k] <- 1 * sm
  }
  xcap1_1A <- c(fun1A[2:n+A])

  fun2A <- replicate(n+A,0)
  for (k in 2:n+A){
    sm <- 0
    for (v in  2:k-2){
      sm <- sm + ( (v2^v) * ( (k-v) * v3 + v4 ) )
    }
    fun2A[k] <- 1 * sm
  }
  xcap1_2A <- c(fun2A[2:n+A])

  fun3A <- numeric(n+A)
  for (k in 2:n+A){
    fun3A[k] <- v2^(k-1) * x01[1]
  }
  xcap1_3A <- fun3A[2:n+A]

  total1A <- xcap1_1A +xcap1_2A+xcap1_3A
  totalA <- c(x01[1],total1A)

  t4 <- length(totalA)
  x0cap4 <- numeric(t4-1)

  for (i in 1:t4-1) {
    x0cap4[i] <- totalA[i+1] - totalA[i]
  }
  x0cap4 <- c(x0cap4[1:t4-1])
  x0cap5 <- tail(x0cap4,A)

  x0cap2 <- c(x0cap,x0cap5 )
  return(x0cap2)

}


