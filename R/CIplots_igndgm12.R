# The IG-NDGM (1, 2) model
# Confidence interval of predicted values

CI_igndgm <- function(fp1,actual1,x,ci){

  LB <- actual1[,1]
  UB <- actual1[,2]

  n <- length(LB)

  x0cap2_U <- fp1[,2]
  x0cap2_L <- fp1[,1]

  x0cap_U <- x0cap2_U[1:n]
  x0cap_L <- x0cap2_L[1:n]

  pred_U <- tail(x0cap2_U,4)
  pred_L <- tail(x0cap2_L,4)

  x0cap5_U <- t(pred_U[1:x])
  x0cap5_L <- t(pred_L[1:x])

  w <- length(x0cap2_U)
  t <- length(x0cap5_U)

  s_U <- rmse(UB, x0cap_U)
  s_L <- rmse(LB, x0cap_L)

  sse_U <- sum((UB - x0cap_U)^2)
  mse_U <- sse_U / (n - 2)

  sse_L <- sum((LB - x0cap_L)^2)
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

  U_LB1 <- c(x0cap_U[n],U_LB)
  U_UB2 <- c(x0cap_U[n],U_UB)
  L_LB1 <- c(x0cap_L[n],L_LB)
  L_UB2 <- c(x0cap_L[n],L_UB)

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

  CIset <- matrix(c(U_LB,U_UB,L_LB,L_UB),ncol=4)

  colnames(CIset, do.NULL = FALSE)
  colnames(CIset) <- c("LB Lower","LB Upper","UB Lower","UB Upper")
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




plotsigndgm <- function(actual,pred,ci,model){

  LB <- actual[,1]
  UB <- actual[,2]
  n <- length(LB)

  x0cap2_U <- pred[,2]
  x0cap2_L <- pred[,1]

  x0cap_U <- x0cap2_U[1:n]
  x0cap_L <- x0cap2_L[1:n]

  pred_U <- tail(x0cap2_U,4)
  pred_L <- tail(x0cap2_L,4)

  x0cap5_U <- t(pred_U[1:4])
  x0cap5_L <- t(pred_L[1:4])

  w <- length(x0cap2_U)
  t <- length(x0cap5_U)

  s_U <- rmse(UB, x0cap_U)
  s_L <- rmse(LB, x0cap_L)

  sse_U <- sum((UB - x0cap_U)^2)
  mse_U <- sse_U / (n - 2)

  sse_L <- sum((LB - x0cap_L)^2)
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

  U_LB1 <- c(x0cap_U[n],U_LB)
  U_UB2 <- c(x0cap_U[n],U_UB)
  L_LB1 <- c(x0cap_L[n],L_LB)
  L_UB2 <- c(x0cap_L[n],L_UB)

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
  U_xy1 <- data.frame(x=U_d0, y=UB)

  L_d0 <- seq(1, n, 1)
  L_xy1 <- data.frame(x=L_d0, y=LB)

  U_d1 <- seq(1, w, 1)
  U_xy2 <- data.frame(x=U_d1, y=x0cap2_U)

  L_d1 <- seq(1, w, 1)
  L_xy2 <- data.frame(x=L_d1, y=x0cap2_L)


  df <- rbind(U_xy1, L_xy1,U_xy2,L_xy2, U_set3, U_set4, L_set3, L_set4)
  colors <- c("Actual values of upper bound" = "grey", "Actual values of lower bound" = "grey","Fitted values of upper bound" = "red", "Fitted values of lower bound" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
  CI <- c(n:w)

  x=y=NULL

  p <- ggplot(df) +
    theme_bw() +
    labs(title = model,x = 'Number of observation',y = 'Data Forecast & Prediction') +
    scale_x_continuous(breaks=1:w) +
    scale_y_continuous(labels = scales::comma) +
    geom_point(data = U_xy2, aes(x = x, y = y), shape = 24, color = "black") +
    geom_point(data = L_xy2, aes(x = x, y = y), shape = 21, color = "black") +
    geom_point(data = U_xy1, aes(x = x, y = y), shape = 24, color = "black") +
    geom_point(data = L_xy1, aes(x = x, y = y), shape = 21, color = "black") +
    geom_point(data = U_set3, aes(x = CI, y = y), shape = 23, color = "black") +
    geom_point(data = U_set4, aes(x = CI, y = y), shape = 23, color = "black") +
    geom_point(data = L_set3, aes(x = CI, y = y), shape = 23, color = "black") +
    geom_point(data = L_set4, aes(x = CI, y = y), shape = 23, color = "black") +
    geom_line(data = U_xy2, aes(x = x, y = y,color = "Fitted values of upper bound")) +
    geom_line(data = L_xy2, aes(x = x, y = y,color = "Fitted values of lower bound")) +
    geom_line(data = U_xy1, aes(x = x, y = y,color = "Actual values of upper bound")) +
    geom_line(data = L_xy1, aes(x = x, y = y,color = "Actual values of lower bound")) +
    geom_line(data = U_set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
    geom_line(data = U_set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
    geom_line(data = L_set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
    geom_line(data = L_set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
    scale_color_manual(name = "Label",values = colors)
  r <- ggplotly(p)

  return(r)

}




