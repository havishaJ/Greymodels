\name{ConfidenceInterval}
\alias{ConfidenceInterval}
\alias{CIvalue}
\alias{CI_rm}
\alias{CI_nhmgmp}
\alias{CI_igndgm}
\alias{CI_mdbgm}


\title{Confidence interval of predicted values

}
\description{The \code{CIvalue}, \code{CI_rm} and \code{CI_mdbgm} functions calculate the confidence interval of the predicted values.

}

\usage{
CIvalue(fp1,actual1,x,ci)
CI_rm(fp1,actual1,x,ci)
CI_nhmgmp(fp1,x01,x02,x,ci)
CI_igndgm(fp1,actual1,x,ci)
CI_mdbgm(fp1,actual1,x,ci)
}

\arguments{
  \item{fp1}{Fitted and predicted values}
  \item{actual1}{Raw data}
  \item{x01}{Raw data of variable 1}
  \item{x02}{Raw data of variable 2}
  \item{x}{Number of forecasts chosen by the user}
  \item{ci}{The confidence level chosen by the user. Values range between 90\%, 95\% and 99\%.}

}

\value{
confidence interval of predicted values
}

\examples{
  # Confidence interval of predicted values for EPGM (1, 1) model

  # fp1 is the sequence of fitted and predicted values

  fp1<-c(560,541.4,517.8,495.3,473.7,453.1,433.4,414.5,396.5)

  # actual1 is the original data

  actual1<-c(560,540,523,500,475)

  fp2 <- t(fp1)

  w <- length(fp2)

  actual2 <- t(actual1)

  n <- length(actual2)

  fitted1 <- fp2[1:n]

  fitted2 <- tail(fp1,4)

  # x is the number of values to predict

  x <- 4

  predicted <- t(fitted2[1:x])

  t <- length(predicted)

  # Performance error - Root mean square error (rmse)

  require("Metrics")

  s <- rmse(actual2, fitted1)

  sse <- sum((actual2 - fitted1)^2)

  mse <- sse / (n - 2)

  # ci is the confidence level (90, 95, 99)

  ci <- 95

  cc <- (ci + 100)/200

  t.val <- qt(cc, n - 2)

  # Calculate prediction interval

  u <- numeric(t)
  l <- numeric(t)

  for (i in 1:t) {
    u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
    l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
  }

  UpperBound <- c(u[1:t])
  LowerBound <- c(l[1:t])

  CIset <- data.frame(LowerBound,UpperBound)
  CIset

}
