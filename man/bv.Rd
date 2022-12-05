\name{BackgroundValues}
\alias{BackgroundValues}
\alias{gm11}
\alias{epgm11}
\alias{tbgm11}
\alias{igm11}
\alias{gm114}

\title{Improved background values
}

\description{A collection of grey forecasting models with improvements to the underlying background value \code{z}.
}

\usage{
gm11(x0)
epgm11(x0)
tbgm11(x0)
igm11(x0)
gm114(x0)
}

\arguments{
  \item{x0}{Raw data}
  \item{gm11}{Basic grey model}
  \item{epgm11}{Extrapolation-based grey model}
  \item{tbgm11}{Data transformation-based grey model}
  \item{igm11}{Improved grey model}
  \item{gm114}{Grey model with single variable, one first-order variable, four background values}
}

\value{
fitted and predicted values
}

\examples{
# GM(1,1) model

# x0 is the original data sequence
x0 <- c(2350,2465,2557,2577,2689,2739,2797,2885,2937,2996)

# Calculate AGO
  x1 <- cumsum(x0)

# Determine length of x0
  n <- length(x0)

# Generate background value sequence Z
  b <- numeric(n)

  for (i in 1:n){
    b[i] <- -(0.5*x1[i + 1] + 0.5*x1[i])
  }

  b1 <- b[1:n-1]

# Create a matrix B
  B <- matrix(1,nrow=n-1,ncol=2)
  B[,1] <- t(t(b1[1:n-1]))

# Create matrix yn
  yn <- matrix(c(x0),ncol=1)
  yn <- t(t(x0[2:n]))

# Estimate parameters a and b by ordinary least squares method (OLS)
  xcap <- solve (t(B)\%*\% B)\%*\% t(B) \%*\% yn
  a <- xcap[1,1]
  b <- xcap[2,1]

# Calculate fitted values
  scale_with <- function(k)
  {
    (x0[1] - (b/a)) * exp(-a*k) * (1 - exp(a))
  }
  fitted <- scale_with(1:n)
  x0cap <- c(x0[1],fitted[1:n-1])
  x0cap

# A is the number of forecast values
  A <- 4

# Predicted values
  x0cap4 <- scale_with(1 : n+A-1)
  x0cap5 <- tail(x0cap4,A)
  x0cap5

# Fitted and predicted values
  x0cap2 <- c(x0cap,x0cap5)
  x0cap2
}

\references{Chang C (2019). Extrapolation-based Grey Model for Small-Dataset Forecasting. Economic Computation and Economic Cybernetics Studies and Research, 53(1), 171-182. DOI:10.24818/18423264/53.1.19.11.
\cr
\cr
Li K, Zhang T (2019). A Novel Grey Forecasting Model and its Application in Forecasting the Energy Consumption in Shanghai. Energy Systems, pp. 1-16. DOI:10.1007/s12667-019-00344-0.
\cr
\cr
Ou S (2012). Forecasting Agricultural Output with an Improved Grey Forecasting Model based on the Genetic Algorithm. Computers and Electronics in Agriculture, 85, 33-39. DOI:10.1016/j.compag.2012.03.007.
\cr
\cr
Li S, Zhou M, Meng W, Zhou W (2019). A new Prediction Model for Forecasting the Automobiles Ownership in China. Journal of Control and Decision, 8(2), 155-164. DOI:10.1080/23307706.2019.1666310.
}
