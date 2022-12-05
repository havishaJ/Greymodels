# Optimization-based grey models

#' A function
#'
#' @param x0 is the original sequence
#'
#' @return
#' @importFrom stats lm
#' @import particle.swarm.optimisation
#' @export

# Model 1 - PSO-GM (1, 1) model: Particle swarm optimization-based grey model

# Parameter optimized by PSO
# Optimize a and b

optim_psogm <- function(x0){

  n <- length(x0)

  fitness_function <- function(values){

    a <- values[1]
    b <- values[2]

    scale_with <- function(k){
      (x0[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
    }
    fitted <- scale_with(2:n-1)

    particule_result <- c(x0[1],fitted)
    fitness <- -(1/n)*sum(abs((x0-particule_result)/x0)*100, na.rm=TRUE)
    return(fitness)
  }

  values_ranges <- list(c(-1,1),c(0,1000))
  swarm <- ParticleSwarm$new(pop_size = 200,
                             values_names = list("a","b"),
                             fitness_function = fitness_function,
                             max_it = 100,
                             acceleration_coefficient_range = list(c(0.5,1.5),c(0.5,1.5)),
                             inertia = 0.7,
                             ranges_of_values = values_ranges)

  swarm$run(plot = FALSE,verbose = FALSE,save_file = FALSE)
  swarm$swarm_best_values

  opt_a <- swarm$swarm_best_values[1]
  opt_b <- swarm$swarm_best_values[2]

  optim_values <- matrix(c(opt_a,opt_b),ncol=2)
  colnames(optim_values, do.NULL = FALSE)
  colnames(optim_values) <- c("optimized value a","optimized value b")
  return(optim_values)

}

# PSO-GM (1, 1) model

psogm11 <- function(x0){

  # Input data x0

  # Length of x0
  n <- length(x0)

  fitness_function <- function(values){
    n <- length(x0)
    a <- values[1]
    b <- values[2]
    scale_with <- function(k){
      (x0[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
    }
    fitted <- scale_with(2:n-1)
    particule_result <- c(x0[1],fitted)
    fitness <- -(1/n)*sum(abs((x0-particule_result)/x0)*100, na.rm=TRUE)
    return(fitness)
  }
  values_ranges <- list(c(-1,1),c(0,1000))
  swarm <- ParticleSwarm$new(pop_size = 200,
                             values_names = list("a","b"),
                             fitness_function = fitness_function,
                             max_it = 100,
                             acceleration_coefficient_range = list(c(0.5,1.5),c(0.5,1.5)),
                             inertia = 0.7,
                             ranges_of_values = values_ranges)

  swarm$run(plot = FALSE,verbose = FALSE,save_file = FALSE)
  swarm$swarm_best_values
  opt_a <- swarm$swarm_best_values[1]
  opt_b <- swarm$swarm_best_values[2]
  optim_values <- matrix(c(opt_a,opt_b),ncol=2)
  colnames(optim_values, do.NULL = FALSE)
  colnames(optim_values) <- c("optimized value a","optimized value b")

  scale_with <- function(k)
  {
    (x0[1] - (opt_b/opt_a)) * exp(-opt_a*k) * (1 - exp(opt_a))
  }
  fitted_values <- scale_with(1:n)
  x0cap <- c(x0[1],fitted_values[1:n-1])

  A <- 4

  # Predicted values
  x0cap4 <- scale_with(1 : n+A-1 )
  x0cap5 <- tail(x0cap4,A)

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)
}



# Model 2 - EGM (1, 1, r) model: Even form of grey model with one variable and one first order equation
# with accumulating generation of order r

# Optimize r by PSO

optim_egm11r <- function(x0){

  fitness_function <- function(values){

    n <- length(x0)

    r <- values[1]

    xr <- replicate(n,0)
    for (k in 1:n){
      sm <- 0
      for (i in 1:k){
        sm <- sm + ( ( gamma(r+k-i)/( gamma(k-i+1) * gamma(r) ) ) * x0[i] )
      }
      xr[k] <- 1*sm
    }

    z <- numeric(n)

    for (i in 1:n){
      z[i] <- -0.5*(xr[i+1] + xr[i])
    }
    z1 <- z[1:n-1]

    mat1 <- matrix(c(z1),ncol=1)
    mat2 <- matrix(1,nrow=n-1,ncol=1)

    B <- cbind(mat1, mat2)

    f <- numeric(n)
    for (i in 1:n){
      f[i] <- (xr[i+1] - xr[i])
    }
    f1 <- f[1:n-1]

    y <- matrix(c(f1),ncol=1)

    acap <- summary(lm(y~B))$coefficients
    a <-acap[2]
    b <-acap[1]

    delta1 <- (1-(0.5*a))/(1+(0.5*a))
    delta2 <- b/(1+(0.5*a))

    xcap <- replicate(n,0)
    for (k in 2:n){
      sm <- 0
      for (i in 2:k-2){
        sm <- sm + ( (delta1^i) * delta2 )
      }
      xcap[k] <- sm + ( delta1^(k-1) * x0[1])
    }
    f1 <- c(x0[1],xcap[2:n])

    l1 <- length(f1)

    fa <- replicate(n,0)

    for (k in 2:n){
      sm <- 0
      for (i in 1:k-1){
        sm <- sm + ( ((-1)^i)* ( gamma(r+1) / ( gamma(i+1)*gamma(r-i+1) ) ) * f1[k-i] )
      }
      fa[k] <- sm * 1
    }
    f2 <- fa[2:n]

    particule_result <- c(x0[1],f2)
    fitness <- -(1/n)*sum(abs((x0-particule_result)/x0)*100, na.rm=TRUE)
    return(fitness)
  }

  values_ranges <- list(c(-100,100))

  swarm <- ParticleSwarm$new(pop_size = 100,
                             values_names = list("r"),
                             fitness_function = fitness_function,
                             max_it = 100,
                             acceleration_coefficient_range = list(c(0.5,1.5),c(0.5,1.5)),
                             inertia = 0.7,
                             ranges_of_values = values_ranges)
  swarm$run(plot = FALSE,verbose = FALSE,save_file = FALSE)

  opt_r <- swarm$swarm_best_values[1]

  optim_values <- matrix(c(opt_r),ncol=1)
  colnames(optim_values, do.NULL = FALSE)
  colnames(optim_values) <- c("optimized value r")
  return(optim_values)

}


# EGM (1, 1, r) model

egm11r <- function(x0){

  fitness_function <- function(values){

    n <- length(x0)
    r <- values[1]
    xr <- replicate(n,0)
    for (k in 1:n){
      sm <- 0
      for (i in 1:k){
        sm <- sm + ( ( gamma(r+k-i)/( gamma(k-i+1) * gamma(r) ) ) * x0[i] )
      }
      xr[k] <- 1*sm
    }
    z <- numeric(n)
    for (i in 1:n){
      z[i] <- -0.5*(xr[i+1] + xr[i])
    }
    z1 <- z[1:n-1]

    mat1 <- matrix(c(z1),ncol=1)
    mat2 <- matrix(1,nrow=n-1,ncol=1)

    B <- cbind(mat1, mat2)

    f <- numeric(n)

    for (i in 1:n){
      f[i] <- (xr[i+1] - xr[i])
    }
    f1 <- f[1:n-1]

    y <- matrix(c(f1),ncol=1)

    acap <- summary(lm(y~B))$coefficients
    a <-acap[2]
    b <-acap[1]

    delta1 <- (1-(0.5*a))/(1+(0.5*a))
    delta2 <- b/(1+(0.5*a))

    xcap <- replicate(n,0)
    for (k in 2:n){
      sm <- 0
      for (i in 2:k-2){
        sm <- sm + ( (delta1^i) * delta2 )
      }
      xcap[k] <- sm + ( delta1^(k-1) * x0[1])
    }
    f1 <- c(x0[1],xcap[2:n])

    l1 <- length(f1)

    fa <- replicate(n,0)

    for (k in 2:n){
      sm <- 0
      for (i in 1:k-1){
        sm <- sm + ( ((-1)^i)* ( gamma(r+1) / ( gamma(i+1)*gamma(r-i+1) ) ) * f1[k-i] )
      }
      fa[k] <- sm * 1
    }
    f2 <- fa[2:n]

    particule_result <- c(x0[1],f2)
    fitness <- -(1/n)*sum(abs((x0-particule_result)/x0)*100, na.rm=TRUE)
    return(fitness)
  }

  values_ranges <- list(c(-100,100))
  swarm <- ParticleSwarm$new(pop_size = 100,
                             values_names = list("r"),
                             fitness_function = fitness_function,
                             max_it = 100,
                             acceleration_coefficient_range = list(c(0.5,1.5),c(0.5,1.5)),
                             inertia = 0.7,
                             ranges_of_values = values_ranges)
  swarm$run(plot = FALSE,verbose = FALSE,save_file = FALSE)

  opt_r <- swarm$swarm_best_values[1]

  n <- length(x0)

  xr <- replicate(n,0)

  for (k in 1:n){
    sm <- 0
    for (i in 1:k){
      sm <- sm + ( ( gamma(opt_r+k-i)/( gamma(k-i+1) * gamma(opt_r) ) ) * x0[i] )
    }
    xr[k] <- 1*sm
  }
  z <- numeric(n)

  for (i in 1:n){
    z[i] <- -0.5*(xr[i+1] + xr[i])
  }
  z1 <- z[1:n-1]

  mat1 <- matrix(c(z1),ncol=1)
  mat2 <- matrix(1,nrow=n-1,ncol=1)

  B <- cbind(mat1, mat2)

  f <- numeric(n)

  for (i in 1:n){
    f[i] <- (xr[i+1] - xr[i])
  }
  f1 <- f[1:n-1]

  y <- matrix(c(f1),ncol=1)

  acap <- summary(lm(y~B))$coefficients
  a <-acap[2]
  b <-acap[1]

  delta1 <- (1-(0.5*a))/(1+(0.5*a))
  delta2 <- b/(1+(0.5*a))

  xcap <- replicate(n,0)

  for (k in 2:n){
    sm <- 0
    for (i in 2:k-2){
      sm <- sm + ( (delta1^i) * delta2 )
    }
    xcap[k] <- sm + ( delta1^(k-1) * x0[1])
  }
  f1 <- c(x0[1],xcap[2:n])

  fa <- replicate(n,0)

  for (k in 2:n){
    sm <- 0
    for (i in 1:k-1){
      sm <- sm + ( ((-1)^i)* ( gamma(opt_r+1) / ( gamma(i+1)*gamma(opt_r-i+1) ) ) * f1[k-i] )
    }
    fa[k] <- sm * 1
  }
  x0cap <- c(x0[1],fa[2:n])

  A <- 4

  nn <- n + A

  xcap_a <- replicate(nn,0)

  for (k in 2:nn){
    sm <- 0
    for (i in 2:k-2){
      sm <- sm + ( (delta1^i) * delta2 )
    }
    xcap_a[k] <- sm + ( delta1^(k-1) * x0[1])
  }
  f1_a <- c(x0[1],xcap_a[2:nn])

  fa_a <- replicate(nn,0)

  for (k in 2:nn){
    sm <- 0
    for (i in 1:k-1){
      sm <- sm + ( ((-1)^i)* ( gamma(opt_r+1) / ( gamma(i+1)*gamma(opt_r-i+1) ) ) * f1_a[k-i] )
    }
    fa_a[k] <- sm * 1
  }
  x0cap4 <- c(x0[1],fa_a[2:nn])

  x0cap5 <- tail(x0cap4,A)

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}



# Model 3 - ANDGM (1, 1) model: Adjacent non-homogeneous discrete grey model

# Optimize r

optim_andgm <- function(x0){

  fitness_function <- function(value)
  {
    r <- value[1]

    n <- length(x0)

    xr1 <- numeric(n)

    for (i in 1:n){
      xr1[i] <-  ( (r-1)/r ) * sum(x0[1:i]) + (1/r)*x0[i+1]
    }
    xr <-  c(x0[1],xr1[1:n-1])

    mat1 <-matrix(xr[1:n-1], nrow=n-1,ncol=1)
    mat2 <-matrix(2:n-1, nrow=n-1,ncol=1)
    mat3 <- matrix(1,nrow=n-1,ncol=1)

    B <- cbind(mat1, mat2, mat3)

    y <- t(t(xr[2:n]))

    rcap <- (solve (t(B) %*% B)) %*% t(B) %*% y

    beta1 <- rcap[1,1]
    beta2 <- rcap[2,1]
    beta3 <- rcap[3,1]

    scale_with <- function(k)
    {
      ( beta1^k * x0[1] ) + ( ( 1 - beta1^k )/( 1 - beta1 ) ) * (beta2*k + beta3)
    }
    forecast1 <- scale_with(1:n)

    xrcap <- c(x0[1],forecast1)

    matrix2 <- matrix("",1,n)
    matrix2 <- as.numeric(matrix2)

    matrix2[1] <- x0[1]

    for (i in 2:length(matrix2+1)) {
      matrix2[i] <- r*xrcap[i] - (r-1)*sum(matrix2[1:i-1])
    }

    particule_result <- matrix2

    fitness <- -(1/n)*sum(abs((x0-particule_result)/x0)*100, na.rm=TRUE)
    return(fitness)
  }
  values_ranges <- list(c(0.001,5))
  swarm <- ParticleSwarm$new(pop_size = 100,
                             values_names = list("r"),
                             fitness_function = fitness_function,
                             max_it = 100,
                             acceleration_coefficient_range = list(c(0.5,1.5),c(0.5,1.5)),
                             inertia = 0.7,
                             ranges_of_values = values_ranges)
  swarm$run(plot = FALSE,verbose = FALSE,save_file = FALSE)
  swarm$swarm_best_values

  opt_r <- swarm$swarm_best_values[1]
  optim_values <- matrix(c(opt_r),ncol=1)
  colnames(optim_values, do.NULL = FALSE)
  colnames(optim_values) <- c("optimized value r")
  return(optim_values)

}

# ANDGM (1, 1) model

andgm11 <- function(x0){

  fitness_function <- function(value)
  {
    r <- value[1]

    n <- length(x0)

    xr1 <- numeric(n)

    for (i in 1:n){
      xr1[i] <-  ( (r-1)/r ) * sum(x0[1:i]) + (1/r)*x0[i+1]
    }
    xr <-  c(x0[1],xr1[1:n-1])

    mat1 <-matrix(xr[1:n-1], nrow=n-1,ncol=1)
    mat2 <-matrix(2:n-1, nrow=n-1,ncol=1)
    mat3 <- matrix(1,nrow=n-1,ncol=1)

    B <- cbind(mat1, mat2, mat3)

    y <- t(t(xr[2:n]))

    rcap <- (solve (t(B) %*% B)) %*% t(B) %*% y
    beta1 <- rcap[1,1]
    beta2 <- rcap[2,1]
    beta3 <- rcap[3,1]

    scale_with <- function(k)
    {
      ( beta1^k * x0[1] ) + ( ( 1 - beta1^k )/( 1 - beta1 ) ) * (beta2*k + beta3)
    }
    forecast1 <- scale_with(1:n)

    xrcap <- c(x0[1],forecast1)

    matrix2 <- matrix("",1,n)
    matrix2 <- as.numeric(matrix2)
    matrix2[1] <- x0[1]

    for (i in 2:length(matrix2+1)) {
      matrix2[i] <- r*xrcap[i] - (r-1)*sum(matrix2[1:i-1])
    }
    particule_result <- matrix2
    fitness <- -(1/n)*sum(abs((x0-particule_result)/x0)*100, na.rm=TRUE)
    return(fitness)
  }
  values_ranges <- list(c(0.001,5))
  swarm <- ParticleSwarm$new(pop_size = 100,
                             values_names = list("r"),
                             fitness_function = fitness_function,
                             max_it = 100,
                             acceleration_coefficient_range = list(c(0.5,1.5),c(0.5,1.5)),
                             inertia = 0.7,
                             ranges_of_values = values_ranges)
  swarm$run(plot = FALSE,verbose = FALSE,save_file = FALSE)
  swarm$swarm_best_values

  opt_r <- swarm$swarm_best_values[1]

  n <- length(x0)

  xr1r <- numeric(n)
  for (i in 1:n){
    xr1r[i] <-  ( (opt_r-1)/opt_r ) * sum(x0[1:i]) + (1/opt_r)*x0[i+1]
  }
  xoptr <-  c(x0[1],xr1r[1:n-1])

  mat1r <-matrix(xoptr[1:n-1], nrow=n-1,ncol=1)
  mat2r <-matrix(2:n-1, nrow=n-1,ncol=1)
  mat3r <- matrix(1,nrow=n-1,ncol=1)

  Br <- cbind(mat1r, mat2r, mat3r)

  yr <- t(t(xoptr[2:n]))

  rcapr <- (solve (t(Br) %*% Br)) %*% t(Br) %*% yr
  beta1r <- rcapr[1,1]
  beta2r <- rcapr[2,1]
  beta3r <- rcapr[3,1]

  scale_with <- function(k)
  {
    ( beta1r^k * x0[1] ) + ( ( 1 - beta1r^k )/( 1 - beta1r ) ) * (beta2r*k + beta3r)
  }
  forecast1r <- scale_with(1:n)

  xrcapr <- c(x0[1],forecast1r)

  matrix2r <- matrix("",1,n)
  matrix2r <- as.numeric(matrix2r)

  matrix2r[1] <- x0[1]

  for (i in 2:length(matrix2r+1)) {
    matrix2r[i] <- opt_r*xrcapr[i] - (opt_r-1)*sum(matrix2r[1:i-1])
  }
  x0cap <- c(matrix2r)

  A <- 4

  # Predicted values
  n <- length(x0)
  nn <- n + A
  scale_with <- function(k)
  {
    ( beta1r^k * x0[1] ) + ( ( 1 - beta1r^k )/( 1 - beta1r ) ) * (beta2r*k + beta3r)
  }
  forecast1ra <- scale_with(1:nn)

  xrcapra <- c(x0[1],forecast1ra)
  matrix2ra <- matrix("",1,nn)
  matrix2ra <- as.numeric(matrix2ra)
  matrix2ra[1] <- x0[1]

  for (i in 2:length(matrix2ra+1)) {
    matrix2ra[i] <- opt_r*xrcapra[i] - (opt_r-1)*sum(matrix2ra[1:i-1])
  }
  x0cap4 <- c(matrix2ra)
  x0cap5 <- tail(x0cap4,A)

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5)
  return(x0cap2)

}








