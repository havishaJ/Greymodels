# The MDBGM (1, 2) model
# Confidence interval of predicted values

CI_mdbgm <- function(fp1,actual1,x,ci){

  # Input lower bound and upper bound of sequence 1
  x01L <- actual1[,1]
  x01U <- actual1[,2]

  # n is the length of the sequence
  n <- length(x01L)

  # Fitted values - Lower and Upper bounds
  x0cap2L <- fp1[,1]
  x0cap2U <- fp1[,2]
  x0cap1L <- x0cap2L[1:n]
  x0cap1U <- x0cap2U[1:n]

  # Predicted values - Lower and Upper bounds
  pred_U <- tail(x0cap2U,4)
  pred_L <- tail(x0cap2L,4)

  # x is the number of forecast values
  x0cap5_U <- t(pred_U[1:x])
  x0cap5_L <- t(pred_L[1:x])

  # Sequence of fitted and predicted values - Lower and Upper bounds
  x0cap2_U <- c(x0cap1U,x0cap5_U )
  x0cap2_L <- c(x0cap1L,x0cap5_L )

  w <- length(x0cap2_U)
  t <- length(x0cap5_U)

  # Performance errors - Root mean square errors
  s_U <- rmse(x01U, x0cap1U)
  s_L <- rmse(x01L, x0cap1L)

  sse_U <- sum((x01U - x0cap1U)^2)
  mse_U <- sse_U / (n - 2)
  sse_L <- sum((x01L - x0cap1L)^2)
  mse_L <- sse_L / (n - 2)

  # confidence interval
  # ci is the level of confidence (90,95,99)
  cc <- (ci + 100)/200
  t.val <- qt(cc, n - 2)

  U_u <- numeric(t)
  U_l <- numeric(t)
  L_u <- numeric(t)
  L_l <- numeric(t)

  for (i in 1:t) {
    U_u[i] = x0cap5_U[i] + (t.val * (sqrt(mse_U) * sqrt(i)))
    U_l[i] = x0cap5_U[i] - (t.val * (sqrt(mse_U) * sqrt(i)))
    L_u[i] = x0cap5_L[i] + (t.val * (sqrt(mse_L) * sqrt(i)))
    L_l[i] = x0cap5_L[i] - (t.val * (sqrt(mse_L) * sqrt(i)))
  }
  U_UB <- c(U_u[1:t])
  U_LB <- c(U_l[1:t])
  L_UB <- c(L_u[1:t])
  L_LB <- c(L_l[1:t])

  U_LB1 <- c(x0cap1U[n],U_LB)
  U_UB2 <- c(x0cap1U[n],U_UB)
  L_LB1 <- c(x0cap1L[n],L_LB)
  L_UB2 <- c(x0cap1L[n],L_UB)

  U_l1 <- length(U_LB1)
  U_d3 <- seq(1, U_l1, 1)
  U_u1 <- length(U_UB2)
  U_d4 <- seq(1, U_u1, 1)
  L_l1 <- length(L_LB1)
  L_d3 <- seq(1, L_l1, 1)
  L_u1 <- length(L_UB2)
  L_d4 <- seq(1, L_u1, 1)

  # Create a data frame
  U_set3 <- data.frame(x=U_d3, y=U_LB1)
  U_set4 <- data.frame(x=U_d4, y=U_UB2)
  L_set3 <- data.frame(x=L_d3, y=L_LB1)
  L_set4 <- data.frame(x=L_d4, y=L_UB2)

  CIset <- matrix(c(L_LB,L_UB,U_LB,U_UB),ncol=4)

  colnames(CIset, do.NULL = FALSE)

  colnames(CIset) <- c("Lower-Lower Bound ","Lower-Upper Bound","Upper-Lower Bound","Upper-Upper Bound")
  return(CIset)

}

#' A function
#'
#' @param actual is the original sequence
#' @param pred is the fitted and predicted sequence
#' @param ci is the confidence level (90, 95, 99)
#' @param model is the grey model selected by user
#'
#' @return
#' @importFrom stats qt
#' @importFrom utils tail
#' @importFrom Metrics rmse
#' @import ggplot2
#' @importFrom plotly ggplotly
#' @export

# Generate plots for the MDBGM (1, 2) model

plots_mdbgm12 <- function(actual,pred,ci,model){

  x01L <- actual[,1]
  x01U <- actual[,2]
  n <- length(x01L)

  x0cap2L <- pred[,1]
  x0cap2U <- pred[,2]

  x0cap1L <- x0cap2L[1:n]
  x0cap1U <- x0cap2U[1:n]

  pred_U <- tail(x0cap2U,4)
  pred_L <- tail(x0cap2L,4)

  x0cap5_U <- t(pred_U[1:4])
  x0cap5_L <- t(pred_L[1:4])
  x0cap2_U <- c(x0cap1U,x0cap5_U )
  x0cap2_L <- c(x0cap1L,x0cap5_L )

  w <- length(x0cap2_U)
  t <- length(x0cap5_U)

  s_U <- rmse(x01U, x0cap1U)
  s_L <- rmse(x01L, x0cap1L)

  sse_U <- sum((x01U - x0cap1U)^2)
  mse_U <- sse_U / (n - 2)
  sse_L <- sum((x01L - x0cap1L)^2)
  mse_L <- sse_L / (n - 2)

  cc <- (ci + 100)/200
  t.val <- qt(cc, n - 2)

  U_u <- numeric(t)
  U_l <- numeric(t)
  L_u <- numeric(t)
  L_l <- numeric(t)
  for (i in 1:t) {
    U_u[i] = x0cap5_U[i] + (t.val * (sqrt(mse_U) * sqrt(i)))
    U_l[i] = x0cap5_U[i] - (t.val * (sqrt(mse_U) * sqrt(i)))
    L_u[i] = x0cap5_L[i] + (t.val * (sqrt(mse_L) * sqrt(i)))
    L_l[i] = x0cap5_L[i] - (t.val * (sqrt(mse_L) * sqrt(i)))
  }
  U_UB <- c(U_u[1:t])
  U_LB <- c(U_l[1:t])
  L_UB <- c(L_u[1:t])
  L_LB <- c(L_l[1:t])

  U_LB1 <- c(x0cap1U[n],U_LB)
  U_UB2 <- c(x0cap1U[n],U_UB)
  L_LB1 <- c(x0cap1L[n],L_LB)
  L_UB2 <- c(x0cap1L[n],L_UB)

  U_l1 <- length(U_LB1)
  U_d3 <- seq(1, U_l1, 1)
  U_u1 <- length(U_UB2)
  U_d4 <- seq(1, U_u1, 1)
  L_l1 <- length(L_LB1)
  L_d3 <- seq(1, L_l1, 1)
  L_u1 <- length(L_UB2)
  L_d4 <- seq(1, L_u1, 1)

  U_set3 <- data.frame(x=U_d3, y=U_LB1)
  U_set4 <- data.frame(x=U_d4, y=U_UB2)
  L_set3 <- data.frame(x=L_d3, y=L_LB1)
  L_set4 <- data.frame(x=L_d4, y=L_UB2)

  U_d0 <- seq(1, n, 1)
  U_xy1 <- data.frame(x=U_d0, y=x01U)
  L_d0 <- seq(1, n, 1)
  L_xy1 <- data.frame(x=L_d0, y=x01L)
  U_d1 <- seq(1, w, 1)
  U_xy2 <- data.frame(x=U_d1, y=x0cap2_U)
  L_d1 <- seq(1, w, 1)

  L_xy2 <- data.frame(x=L_d1, y=x0cap2_L)
  df <- rbind(U_xy1, L_xy1, U_set3, U_set4, L_set3, L_set4)

  colors <- c("Predictive values of the upper bound" = "red", "Predictive values of the lower bound" = "blue", "Actual values of the upper bound" = "purple","Actual values of the lower bound" = "orange", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
  CI <- c(n:w)

  x=y=NULL

  p <- ggplot(df) +
    theme_bw() +
    labs(title = model,x = 'Number of observation',y = 'Data Forecast & Prediction') +
    scale_x_continuous(breaks=1:w) +
    scale_y_continuous(labels = scales::comma) +
    geom_point(data = U_xy1, aes(x = x, y = y), shape = 23, color = "black") +
    geom_point(data = L_xy1, aes(x = x, y = y), shape = 23, color = "black") +
    geom_point(data = U_xy2, aes(x = x, y = y), shape = 24, color = "black") +
    geom_point(data = L_xy2, aes(x = x, y = y), shape = 21, color = "black") +
    geom_point(data = U_set3, aes(x = CI, y = y), shape = 23, color = "black") +
    geom_point(data = U_set4, aes(x = CI, y = y), shape = 23, color = "black") +
    geom_point(data = L_set3, aes(x = CI, y = y), shape = 23, color = "black") +
    geom_point(data = L_set4, aes(x = CI, y = y), shape = 23, color = "black") +
    geom_line(data = U_xy2, aes(x = x, y = y,color = "Predictive values of the upper bound")) +
    geom_line(data = L_xy2, aes(x = x, y = y,color = "Predictive values of the lower bound")) +
    geom_line(data = U_xy1, aes(x = x, y = y,color = "Actual values of the upper bound")) +
    geom_line(data = L_xy1, aes(x = x, y = y,color = "Actual values of the lower bound")) +
    geom_line(data = U_set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
    geom_line(data = U_set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
    geom_line(data = L_set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
    geom_line(data = L_set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
    scale_color_manual(name = "Label",values = colors)
  r <- ggplotly(p)

  return(r)

}
