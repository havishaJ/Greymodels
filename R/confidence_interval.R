# Calculate confidence interval of predicted values

#' A function
#'
#' @param fp1
#' @param actual1
#' @param x
#' @param ci
#'
#' @return
#' @importFrom stats qt
#' @importFrom utils tail
#' @importFrom Metrics rmse
#' @export


CIvalue <- function(fp1,actual1,x,ci){

  # fp1 is the sequence of fitted and predicted values
  # actual1 is the original data

  fp2 <- t(fp1)

  w <- length(fp2)

  actual2 <- t(actual1)

  n <- length(actual2)

  fitted1 <- fp2[1:n]

  fitted2 <- tail(fp1,4)

  # x is the number of values to predict

  predicted <- t(fitted2[1:x])

  t <- length(predicted)

  # Performance error - Root mean square error (rmse)

  s <- rmse(actual2, fitted1)

  sse <- sum((actual2 - fitted1)^2)

  mse <- sse / (n - 2)

  # ci is the confidence level (90, 95, 99)

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
  return(CIset)

}
