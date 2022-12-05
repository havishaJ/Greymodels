\name{ResidualModification}
\alias{ResidualModification}
\alias{remnantgm11}
\alias{tgm11}

\title{Residual modification

}
\description{A collection of grey forecasting models based on residual grey models.

}
\usage{
remnantgm11(x0,x0_A)
tgm11(x0,x0_A)
}

\arguments{
  \item{x0}{Raw data (training set)}
  \item{x0_A}{Raw data (testing set)}
  \item{remnantgm11}{Residual-based grey model}
  \item{tgm11}{Trigonometric grey model}


}

\value{
fitted and predicted values
}

\examples{
  # TGM (1, 1) model: Trigonometric grey model

  x0 <- c(2350,2465,2557,2577,2689,2739,2797,2885,2937,2996)
  x0_A <- c(3042,3120,3132,3237)

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

  xcap <- solve (t(B) \%*\% B) \%*\% t(B) \%*\% yn
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

  rcap <- (solve (t(B) \%*\% B)) \%*\% t(B) \%*\% rn
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
  # Fitted and predicted values
  x0cap2

}

\references{
Hu Y (2020). Energy Demand Forecasting using a Novel Remnant GM (1, 1) Model. Soft Computing, pp. 13903-13912. DOI:10.1007/s00500-020-04765-3.
\cr
\cr
Zhou P, Ang B, Poh K (2006). A Trigonometric Grey Prediction Approach to Forecasting Electricity Demand. Energy, 31(14), 2839-2847. DOI:10.1016/j.energy.2005.12.002.

}
