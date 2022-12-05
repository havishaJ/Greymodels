\name{CombinedModels}
\alias{CombinedModels}
\alias{ngbm11}
\alias{ggvm11}
\alias{tfdgm11}

\title{Combined models
}

\description{A collection of hybrid grey forecasting models.
}

\usage{
ngbm11(x0)
ggvm11(x0)
tfdgm11(x0)
}

\arguments{
  \item{x0}{Raw data}
  \item{ngbm11}{Non-linear grey Bernoulli model}
  \item{ggvm11}{Grey generalized Verhulst model}
  \item{tfdgm11}{Traffic flow mechanics grey model}
}

\value{
fitted and predicted values
}

\examples{
  #TFDGM (1, 1) model: Traffic flow mechanics grey model

  # Input data x0
  x0 <- c(129,151,132,144,119,125,127,132)
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

  pcap <- (solve (t(B) \%*\% B)) \%*\% t(B) \%*\% y
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
  # Fitted values
  x0cap

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

  # Predicted values
  x0cap5 <- tail(x0cap4,A)
  x0cap5

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5)
  x0cap2

}

\references{
Chen C (2008). Application of the Novel Nonlinear Grey Bernoulli Model for Forecasting Unemployment Rate. Chaos, Solitons and Fractals, 37(1), 278-287. DOI:10.1016/j.chaos.2006.08.024.
\cr
\cr
Zhou W, Pei L (2020). The Grey Generalized Verhulst model and its Application for Forecasting Chinese Pig Price Index. Soft Computing, 24, 4977-4990. DOI:10.1007/s00500-019-04248-0.
\cr
\cr
Xiao X, Duan H (2020). A New Grey Model for Traffic Fow Mechanisms. Engineering Applications of Artificial Intelligence, 88(2020), 103350. DOI:10.1016/j.engappai.2019.103350.

}
