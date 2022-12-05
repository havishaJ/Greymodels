\name{ExtendedForms}
\alias{ExtendedForms}
\alias{dgm11}
\alias{dgm21}
\alias{odgm21}
\alias{ndgm11}
\alias{vssgm11}
\alias{gom11}
\alias{gomia11}
\alias{ungom11}
\alias{exgm11}
\alias{egm11}

\title{Extended forms of grey models
}

\description{A collection of extended grey forecasting models.
}

\usage{
dgm11(x0)
dgm21(x0)
odgm21(x0)
ndgm11(x0)
vssgm11(x0)
gom11(x0)
gomia11(x0)
ungom11(x0)
exgm11(x0)
egm11(k,x0,k_A,x0_A)
}

\arguments{
  \item{x0}{Raw data}
  \item{k}{Data index of raw data}
  \item{x0_A}{Raw data (testing set)}
  \item{k_A}{Data index (testing set)}
  \item{dgm11}{Discrete grey model with single variable, first order differential equation}
  \item{dgm21}{Discrete grey model with single variable, second order differential equation model}
  \item{odgm21}{Optimized discrete grey model with single variable, second order differential equation}
  \item{ndgm11}{Non-homogeneous discrete grey model}
  \item{vssgm11}{Variable speed and adaptive structure-based grey model}
  \item{gom11}{Grey opposite-direction model based on inverse accumulation and traditional interpolation method}
  \item{gomia11}{Grey opposite-direction model based on inverse accumulation}
  \item{ungom11}{Unbiased grey opposite-direction model based on inverse accumulation}
  \item{exgm11}{Exponential grey model}
  \item{egm11}{Extended grey model}
}

\value{
fitted and predicted values
}

\examples{
  # EXGM (1, 1): Exponential grey model

  # Input data x0
  x0 <- c(2028,2066,2080,2112,2170,2275,2356,2428)

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
  rcap <- (solve (t(B2) \%*\% B2)) \%*\% t(B2) \%*\% y
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
  # Fitted values
  x0cap

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
  # Predicted values
  x0cap5

  x0cap2 <- c(x0cap,x0cap5)
  # Fitted and predicted values
  x0cap2
}

\references{
Xie N, Liu S (2009). Discrete Grey Forecasting Model and its Application. Applied Mathematical Modelling, 33(2), 1173-1186. DOI:10.1016/j.apm.2008.01.011.
\cr
\cr
Shao Y, Su H (2012). On Approximating Grey Model DGM (2, 1). 2012 AASRI Conference on Computational Intelligence and Bioinformatics, 1, 8-13. DOI:10.1016/j.aasri.2012.06.003.
\cr
\cr
Xie N, Liu S, Yang Y, Yuan C (2013). On Novel Grey Forecasting Model based on Non-homogeneous Index Sequence. Applied Mathematical Modelling, 37, 5059-5068. DOI:10.1016/j.apm.2012.10.037.
\cr
\cr
Li S, Miao Y, Li G, Ikram M (2020). A Novel Varistructure Grey Forecasting Model with Speed Adaptation and its Application. Mathematical and Computers in Simulation, 172, 45-70. DOI:10.1016/j.matcom.2019.12.020.
\cr
\cr
Che X, Luo Y, He Z (2013). Grey New Information GOM (1, 1) Model based Opposite-Direction Accumulated Generating and its Application. Applied Mechanics and Materials, 364, 207-210. DOI:10.4028/www.scientific.net/AMM.364.207.
\cr
\cr
Power Load Forecasting based on GOM (1, 1) Model under the Condition of Missing Data. 2016 IEEEPES Asia-Pacific Power and Energy Engineering Conference (APPEEC), pp. 2461-2464. DOI:10.1109/appeec.2016.7779929.
\cr
\cr
Luo Y, Liao D (2012). Grey New Information Unbiased GOM (1, 1) Model based on Opposite-Direction Accumulated Generating and its Application. Advanced Materials Research, 507, 265-268. DOI:10.4028/www.scientific.net/AMR.507.265.
\cr
\cr
Bilgil H (2020). New Grey Forecasting Model with its Application and Computer Code. AIMS Mathematics, 6(2), 1497-1514. DOI: 10.3934/math.2021091.
\cr
\cr
An Extended Grey Forecasting Model for Omnidirectional Forecasting considering Data Gap Difference. Applied Mathematical Modeling, 35, 5051-5058. DOI:10.1016/j.apm.2011.04.006.
}
