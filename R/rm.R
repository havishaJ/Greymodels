# Residual Modification

# Model 1 - Remnant GM (1, 1) model: Residual Modification GM (1, 1) grey model

remnantgm11 <- function(x0,x0_A){

  # Input data
  # x0 is the in-sample data
  # x0_A is the out-sample data

  x1 <- cumsum(x0)

  n <- length(x0)

  b <- numeric(n)
  for (i in 1:n){
    b[i] <- -(0.5*x1[i + 1] + 0.5*x1[i])
  }
  b1 <- b[1:n-1]

  B <- matrix(1,nrow=n-1,ncol=2)

  B[,1] <- t(t(b1[1:n-1]))

  yn <- matrix(c(x0),ncol=1)
  yn <- t(t(x0[2:n]))

  xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
  a <- xcap[1,1]
  b <- xcap[2,1]

  scale_with <- function(k)
  {
    (x0[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
  }
  bestfit <- scale_with(1:n)

  x0cap <- c(x0[1],bestfit)

  error <- numeric(n)
  signe <- numeric(n)

  for (i in 1:n){
    signe[i] <- sign(x0[i] - x0cap[i])
    error[i] <- abs(x0[i] - x0cap[i])
    e <- error[1:n]
  }

  Error <- c(e[2:n])
  x1e <- cumsum(Error)
  m <- length(Error)
  bb <- numeric(m)

  for (i in 1:m){
    bb[i] <- -(0.5*x1e[i + 1] + 0.5*x1e[i])
  }
  b1 <- bb[1:m-1]

  Be <- matrix(1,nrow=m-1,ncol=2)
  Be[,1] <- t(t(b1[1:m-1]))

  Ye <- matrix(c(Error),ncol=1)
  Ye <- t(t(Error[2:m]))

  xcap <- solve (t(Be) %*% Be) %*% t(Be) %*% Ye
  ae <- xcap[1,1]
  be <- xcap[2,1]

  scale_with <- function(k)
  {
    (1-exp(ae))*(Error[1]-(be/ae))*exp(-ae*(k-1))
  }

  forecast1 <- scale_with(3:n)
  forecast <- matrix(c(forecast1[1:m-1]),ncol=1)

  Signe <- matrix(c(signe[3:n]),ncol=1)

  gm_x0cap <- matrix(c(x0cap[3:n]),ncol=1)

  remnant_x0cap1 <-  gm_x0cap + (Signe*forecast)
  remnant_x0cap <- c(x0[1],x0[2],remnant_x0cap1)

  A <- 4
  nn <- n + A

  scale_with <- function(k)
  {
    (x0[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
  }
  gm_A <- scale_with(1:nn)
  x0cap_A <- c(x0[1],gm_A[1:nn-1])

  error_A <- numeric(nn)
  signe_A <- numeric(nn)

  for (i in 1:nn){
    signe_A[i] <- sign(x0_A[i] - gm_A[i])
    error_A[i] <- abs(x0_A[i] - gm_A[i])
    e_A <- error_A[1:nn]
  }
  Error_A <- c(e_A[1:nn])

  scale_with <- function(k)
  {
    (1-exp(ae))*(Error[1]-(be/ae))*exp(-ae*(k-1))
  }
  forecast1_A <- scale_with(1:nn)

  forecast_A <- matrix(c(forecast1_A[1:nn]),ncol=1)

  Signe_A <- matrix(c(signe_A[1:nn]),ncol=1)

  gm_x0capA <- matrix(c(x0cap_A[1:nn]),ncol=1)

  remnant_x0cap1A <-  gm_x0capA + (Signe_A*forecast_A)

  remnant_x0capA <- c(remnant_x0cap1A)

  x0cap5 <- tail(remnant_x0capA,A)
  x0cap2 <- c(remnant_x0cap,x0cap5)
  return(x0cap2)

}


# Model 2 _ TGM (1, 1) model: Trigonometric grey model

tgm11 <- function(x0,x0_A){

  x1 <- cumsum(x0)

  n <- length(x0)

  b <- numeric(n)
  for (i in 1:n){
    b[i] <- -(0.5*x1[i + 1] + 0.5*x1[i])
  }
  b1 <- b[1:n-1]

  B <- matrix(1,nrow=n-1,ncol=2)
  B[,1] <- t(t(b1[1:n-1]))

  yn <- matrix(c(x0),ncol=1)
  yn <- t(t(x0[2:n]))

  xcap <- solve (t(B) %*% B) %*% t(B) %*% yn
  a <- xcap[1,1]
  b <- xcap[2,1]

  scale_with <- function(k)
  {
    (x0[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
  }
  fitted <- scale_with(1:n)

  x0cap <- c(x0[1],fitted[1:n-1])

  x0cap_GM <- c(x0cap)

  n <- length(x0)

  r0 <- numeric(n)

  for (i in 1:n){
    r0[i] <-x0[i] - x0cap_GM[i]
  }
  R <- r0[2:n]

  rn <- matrix(c(R),ncol=1)

  m <- length(rn)

  L <- 23

  mat1 <- matrix(1,nrow=n-1,ncol=1)
  mat2 <-matrix(1:m,nrow=m,ncol=1)

  s <- replicate(n,0)
  for (i in 1:n){
    s[i] <- sin( (2*(i-1)*pi)/L )
  }
  mat3 <- matrix(c(s[2:n]),ncol=1)

  c <- replicate(n,0)
  for (i in 1:n){
    c[i] <- cos( (2*(i-1)*pi)/L )
  }
  mat4 <- matrix(c(c[2:n]),ncol=1)

  B <- cbind(mat1,mat2,mat3,mat4)

  rcap <- (solve (t(B) %*% B)) %*% t(B) %*% rn
  b0 <- rcap[1,1]
  b1 <- rcap[2,1]
  b2 <- rcap[3,1]
  b3 <- rcap[4,1]

  scale_with <- function(k)
  {
    b0 + (b1*k) + (b2*sin( (2*pi*k)/L )) + (b3*cos( (2*pi*k)/L ))
  }
  forecast <- scale_with(1:m)

  r0cap <- c(0,forecast)

  xcap_tr <- r0cap + x0cap_GM

  A <- 4
  scale_with <- function(k)
  {
    (x0[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
  }
  fitted_a <- scale_with(1 : n+A-1)

  x0cap_GMa <- c(fitted_a)

  predicted_a <- tail(x0cap_GMa,A)


  n_a <- length(x0_A)

  r0_a <- numeric(n_a)
  for (i in 1:n_a){
    r0_a[i] <-x0_A[i] - x0cap_GMa[i]
  }
  R_a <- r0_a[1:n_a]

  rn_a <- matrix(c(R_a),ncol=1)

  scale_with <- function(k)
  {
    b0 + (b1*k) + (b2*sin( (2*pi*k)/L )) + (b3*cos( (2*pi*k)/L ))
  }
  forecast_a <- scale_with(1:m+A)

  r0cap_a <- tail(forecast_a,A)

  xcap_tra <- r0cap_a +  predicted_a

  x0cap5 <- c(xcap_tra)
  x0cap2 <- c(xcap_tr,x0cap5 )
  return(x0cap2)

}


