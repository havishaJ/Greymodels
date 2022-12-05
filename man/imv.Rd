\name{IntervalMultivariable}
\alias{IntervalMultivariable}
\alias{igndgm12}
\alias{mdbgm12}

\title{Multivariate interval sequences

}

\description{A collection of multivariate grey forecasting models based on interval number sequences.

}
\usage{
igndgm12(LB,UB)
mdbgm12(x01L,x01U,x02L,x02U,x01La,x01Ua,x02La,x02Ua)
}

\arguments{
  \item{LB, UB}{Lower and upper bound of interval sequence}
  \item{x01L,x01U}{Lower and upper bound of first interval sequence (training set)}
  \item{x02L,x02U}{Lower and upper bound of second interval sequence (training set)}
  \item{x01La,x01Ua}{Lower and upper bound of first interval sequence (testing set)}
  \item{x02La,x02Ua}{Lower and upper bound of second interval sequence (testing set)}
  \item{igndgm12}{Interval grey number sequence based on non-homogeneous discrete grey model}
  \item{mdbgm12}{Multivariate grey model based on dynamic background algorithm}


}

\value{
fitted and predicted values
}

\examples{
  #MDBGM (1, 2) model: Multivariate grey model based on dynamic background algorithm.

  # Input data
  #x01 Lower and upper bound of sequence 1
  #x02 Lower and upper bound of sequence 2

  # x01L is the lower bound of sequence 1
  x01L <- c(2721,3136,3634,3374,3835,3595,3812,4488)

  # x01U is the upper bound of sequence 1
  x01U <- c(3975,4349,4556,5103,5097,5124,5631,6072)

  # x02L is the lower bound of sequence
  x02L <- c(24581,30070,36656,36075,42173,42074,45537,55949)

  # x02U is the upper bound of sequence 2
  x02U <- c(41731,49700,55567,61684,68295,68342,73989,78194)

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
  A1 <- solve (t(X) \%*\% X) \%*\% t(X) \%*\% YL
  miu11 <- A1[1,1]
  miu12 <- A1[2,1]
  gamma11 <- A1[3,1]
  gamma12 <- A1[4,1]
  g1 <- A1[5,1]
  h1 <- A1[6,1]

  # Parameters estimation by OLS - Upper
  A2 <- solve (t(X) \%*\% X) \%*\% t(X) \%*\% YU
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
  x0cap

}

\references{
Xie N, Liu S (2015). Interval Grey Number Sequence Prediction by using Nonhomogeneous Exponential Discrete Grey Forecasting Model. Journal of Systems Engineering and Electronics, 26(1), 96-102. DOI:10.1109/JSEE.2015.00013.
\cr
\cr
Zeng X, Yan S, He F, Shi Y (2019). Multivariable Grey Model based on Dynamic Background Algorithm for Forecasting the Interval Sequence. Applied Mathematical Modelling, 80(23). DOI:10.1016/j.apm.2019.11.032.

}
