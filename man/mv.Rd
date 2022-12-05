\name{Multivariable}
\alias{Multivariable}
\alias{gm13}
\alias{igm13}
\alias{nhmgm1}
\alias{nhmgm2}
\alias{gmcg12}
\alias{gmc12}
\alias{dbgm12}

\title{Multivariate sequences

}

\description{A collection of grey forecasting models based on multiple variables.

}

\usage{
gm13(x1,x2,x3)
igm13(x1,x2,x3)
nhmgm1(x01,x02)
nhmgm2(x01,x02)
gmcg12(x01,x02,dat_a)
gmc12(x01,x02,dat_a)
dbgm12(x01,x02,dat_a)
}

\arguments{
  \item{x1,x2,x3}{Raw data of 3 variables (training set)}
  \item{x01,x02}{Raw data of 2 variables (training set)}
  \item{dat_a}{Raw data of x02 (testing set)}
  \item{gm13}{Grey multivariate model with first order differential equation and 3 variables}
  \item{igm13}{Improved grey multivariate model with first order differential equation and 3 variables}
  \item{nhmgm1}{Non-homogeneous multivariate grey model with first order differential equation and 2 variables with p = 1}
  \item{nhmgm2}{Non-homogeneous multivariate grey model with first order differential equation and 2 variables with p = 2}
  \item{gmcg12}{Multivariate grey convolution model with first order differential equation and 2 variables using the Gaussian rule}
  \item{gmc12}{Multivariate grey convolution model with first order differential equation and 2 variables using the trapezoidal rule}
  \item{dbgm12}{Multivariate grey model with dynamic background value, first order differential equation and 2 variables using the Gaussian rule}


}

\value{
fitted and predicted values
}

\examples{
  # GMC_g (1, 2) model

  # Input raw data
  x01 <- c(897,897,890,876,848,814)
  x02 <- c(514,495,444,401,352,293)
  dat_a <- c(514,495,444,401,352,293,269,235,201,187)

  # AGO
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

  xcap <- solve (t(B) \%*\% B) \%*\% t(B) \%*\% yn

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
  # Fitted values
  x0cap

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
  # Predicted values
  x0cap5

  # Fitted & Predicted values
  x0cap2 <- c(x0cap,x0cap5 )
  x0cap2

}

\references{
Cheng M, Li J, Liu Y, Liu B (2020). Forecasting Clean Energy Consumption in China by 2025: Using Improved Grey Model GM (1, N). Sustainability, 12(2), 1-20. DOI:10.3390/su12020698.
\cr
\cr
Wang H, Wang P, Senel M, Li T (2019). On Novel Non-homogeneous Multivariable Grey Forecasting Model NHMGM. Mathematical Problems in Engineering, 2019, 1-13. DOI:10.1155/2019/9049815.
\cr
\cr
Ding S, Li R (2020). A New Multivariable Grey Convolution model based on Simpson's rule and its Application. Complexity, pp. 1-14. DOI:10.1155/2020/4564653.
\cr
\cr
Zeng B, Li C (2018). Improved Multivariable Grey Forecasting Model and with a Dynamic Background Value Coefficient and its Application. Computers and Industrial Engineering, 118, 278-290. DOI:10.1016/j.cie.2018.02.042.


}
