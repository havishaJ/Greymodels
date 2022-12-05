\name{ParametersEstimation}
\alias{ParametersEstimation}
\alias{sogm21}
\alias{ngm11k}
\alias{ngm11kc}
\alias{ongm11kc}

\title{Parameters estimation
}

\description{A collection of grey forecasting models based on parameters estimation.
}

\usage{
sogm21(x0)
ngm11k(x0)
ngm11kc(x0)
ongm11kc(x0)
}

\arguments{
  \item{x0}{Raw data}
  \item{sogm21}{Structured optimized grey model with single variable and second order differential equation}
  \item{ngm11k}{Nonlinear grey model}
  \item{ngm11kc}{Nonlinear grey model}
  \item{ongm11kc}{Optimized nonlinear grey model}

}

\value{
fitted and predicted values
}

\examples{
  # ONGM (1, 1, k, c) model: Nonlinear grey model

  # Input data x0
  x0 <- c(23.36,43.19,58.73,70.87,83.71,92.91,99.73,105.08,109.73,112.19,113.45)

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
  rcap <- (solve (t(B2) \%*\% B2)) \%*\% t(B2) \%*\% y
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
  # Fitted values
  x0cap

  A <- 4

  x0cap4 <- scale_with(1 : tm+A )

  x0cap5 <- tail(x0cap4,A)
  # Predicted values
  x0cap5

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5)
  x0cap2

}

\references{
Xu N, Dang Y (2015). An Optimized Grey GM (2, 1) Model and Forecasting of Highway Subgrade Settlement. Mathematical Problems in Engineering, 2015(1), 1-6. DOI:10.1155/2015/606707.
\cr
\cr
Chen P, Yu H (2014). Foundation Settlement Prediction based on a Novel NGM Model. Mathematical Problems in Engineering 2014, 242809. DOI:10.1155/2014/242809.

}
