\name{Optimization}
\alias{Optimization}
\alias{optim_psogm}
\alias{psogm11}
\alias{optim_andgm}
\alias{andgm11}
\alias{optim_egm11r}
\alias{egm11r}

\title{Optimization-based grey models

}

\description{A collection of grey forecasting models using optimization techniques to find optimal parameters of grey models.

}

\usage{
optim_psogm(x0)
psogm11(x0)
optim_andgm(x0)
andgm11(x0)
optim_egm11r(x0)
egm11r(x0)

}

\arguments{
  \item{x0}{Raw data}
  \item{optim_psogm}{Parameters optimization (a and b) by particle swarm optimization(PSO)}
  \item{psogm11}{Particle swarm optimization-based grey model}
  \item{optim_andgm}{Parameters optimization (r) by PSO}
  \item{andgm11}{Adjacent non-homogeneous discrete grey model}
  \item{optim_egm11r}{Parameters optimization (r) by PSO}
  \item{egm11r}{Even form of grey model with one variable and one first order equation with accumulating generation of order r}


}

\value{
fitted and predicted values
}

\examples{
# Input raw data
x0 <- c(2.8,3.8,4.6,5.2,5.7,6.0,6.2,6.92,7.77,8.92,10.06)

# Parameter optimization

library(particle.swarm.optimisation)

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

    rcap <- (solve (t(B) \%*\% B)) \%*\% t(B) \%*\% y
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
  opt_r

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

  rcapr <- (solve (t(Br) \%*\% Br)) \%*\% t(Br) \%*\% yr
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
  # Fitted values
  x0cap

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
  # Predicted values
  x0cap5

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5)
  x0cap2

}

\references{
Zeng B, Li S, Meng W, Zhang D (2019). An Improved Grey Prediction Model for China's Beef Comsumption Forecasting. PLOS ONE, 14(9), 1-18. DOI:10.1371/journal.pone.0221333.
\cr
\cr
Liu L, Wu L (2021). Forecasting the Renewable Energy Consumption of the European Countries by an Adjacent Non-homogeneous Grey Model. Applied Mathematical Modelling, 89, 1932-1948. DOI:10.1016/j.apm.2020.08.080.

}
