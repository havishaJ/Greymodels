# Multivariate models

# Generate plots
plotsmv1 <- function(actual1,fp1,ci,model){

  # actual1 is the original data
  # fp1 is the fitted and predicted data
  # ci is the confidence level

  actual <- actual1[ ,1]
  actual2 <- t(actual)

  n <- length(actual2)

  fp2 <- t(fp1)

  w <- length(fp2)
  n <- length(actual2)

  fitted1 <- fp2[1:n]

  fitted2 <- tail(fp1,4)

  predicted <- t(fitted2[1:4])

  t <- length(predicted)

  s <- rmse(actual2, fitted1)
  sse <- sum((actual2 - fitted1)^2)
  mse <- sse / (n - 2)

  cc <- (ci + 100)/200
  t.val <- qt(cc, n - 2)

  u <- numeric(t)
  l <- numeric(t)
  for (i in 1:t) {
    u[i] = predicted[i] + (t.val * (sqrt(mse) * sqrt(i)))
    l[i] = predicted[i] - (t.val * (sqrt(mse) * sqrt(i)))
  }
  UB <- c(u[1:t])
  LB <- c(l[1:t])

  LB1 <- c(fitted1[n],LB)
  UB2 <- c(fitted1[n],UB)

  l1 <- length(LB1)
  d3 <- seq(1, l1, 1)
  u1 <- length(UB2)
  d4 <- seq(1, u1, 1)

  set3 <- data.frame(x=d3, y=LB1)
  set4 <- data.frame(x=d4, y=UB2)

  d0 <- seq(1, n, 1)
  xy1 <- data.frame(x=d0, y=actual)

  d1 <- seq(1, w, 1)
  xy2 <- data.frame(x=d1, y=fp1)

  df <- rbind(xy1, xy2, set3, set4)

  colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
  CI <- c(n:w)

  x=y=NULL

  p <- ggplot(df) +
    theme_bw() +
    labs(title = model,x = 'Number of observation',y = 'Data Forecast & Prediction') +
    scale_x_continuous(breaks=1:w) +
    scale_y_continuous(labels = scales::comma) +
    geom_point(data = xy1, aes(x = x, y = y), shape = 24, color = "black") +
    geom_point(data = xy2, aes(x = x, y = y), shape = 21, color = "black") +
    geom_point(data = set3, aes(x = CI, y = y), shape = 23, color = "black") +
    geom_point(data = set4, aes(x = CI, y = y), shape = 23, color = "black") +
    geom_line(data = xy1, aes(x = x, y = y,color = "Original Data")) +
    geom_line(data = xy2, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
    geom_line(data = set3, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
    geom_line(data = set4, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
    scale_color_manual(name = "Label",values = colors)
  r <- ggplotly(p)

  return(r)

}


# Generate plots
# NHMGM models

plotsmv2 <- function(actual1,fitted,ci,model){

  # Input data
  # x01 - sequence 1
  # x02 - sequence 2

  x01 <- actual1[,1]
  x02 <- actual1[,2]

  n <- length(x01)

  p1 <- fitted[,1]
  p2 <- fitted[,2]

  fitted_1 <- p1[1:n]
  fitted_2 <- p2[1:n]

  forecast_1a <- tail(p1,4)
  forecast_2a <- tail(p2,4)

  forecast_1 <- forecast_1a[1:4]
  forecast_2 <- forecast_2a[1:4]

  x0cap2_x1 <- c(fitted_1,forecast_1 )
  x0cap2_x2 <- c(fitted_2,forecast_2 )

  w <- length(x0cap2_x1)

  t <- length(forecast_1)

  s_x1 <- rmse(x01, fitted_1)
  s_x2 <- rmse(x02, fitted_2)

  sse_x1 <- sum((x01 - fitted_1)^2)
  mse_x1 <- sse_x1 / (n - 2)

  sse_x2 <- sum((x02 - fitted_2)^2)
  mse_x2 <- sse_x2 / (n - 2)

  cc <- (ci + 100)/200
  t.val <- qt(cc, n - 2)

  u_x1 <- numeric(t)
  l_x1 <- numeric(t)
  for (i in 1:t) {
    u_x1[i] = forecast_1[i] + (t.val * (sqrt(mse_x1) * sqrt(i)))
    l_x1[i] = forecast_1[i] - (t.val * (sqrt(mse_x1) * sqrt(i)))
  }
  UB_x1 <- c(u_x1[1:t])
  LB_x1 <- c(l_x1[1:t])

  LB1_x1 <- c(fitted_1[n],LB_x1)
  UB2_x1 <- c(fitted_1[n],UB_x1)

  l1_x1 <- length(LB1_x1)
  d3_x1 <- seq(1, l1_x1, 1)
  u1_x1 <- length(UB2_x1)
  d4_x1 <- seq(1, u1_x1, 1)

  set3_x1 <- data.frame(x=d3_x1, y=LB1_x1)
  set4_x1 <- data.frame(x=d4_x1, y=UB2_x1)

  u_x2 <- numeric(t)
  l_x2 <- numeric(t)
  for (i in 1:t) {
    u_x2[i] = forecast_2[i] + (t.val * (sqrt(mse_x2) * sqrt(i)))
    l_x2[i] = forecast_2[i] - (t.val * (sqrt(mse_x2) * sqrt(i)))
  }
  UB_x2 <- c(u_x2[1:t])
  LB_x2 <- c(l_x2[1:t])

  LB1_x2 <- c(fitted_2[n],LB_x2)
  UB2_x2 <- c(fitted_2[n],UB_x2)

  l1_x2 <- length(LB1_x2)
  d3_x2 <- seq(1, l1_x2, 1)
  u1_x2 <- length(UB2_x2)
  d4_x2 <- seq(1, u1_x2, 1)

  set3_x2 <- data.frame(x=d3_x2, y=LB1_x2)
  set4_x2 <- data.frame(x=d4_x2, y=UB2_x2)

  d0_x1 <- seq(1, n, 1)
  xy1_x1 <- data.frame(x=d0_x1, y=x01)

  d0_x2 <- seq(1, n, 1)
  xy1_x2 <- data.frame(x=d0_x2, y=x02)

  d1_x1 <- seq(1, w, 1)
  xy2_x1 <- data.frame(x=d1_x1, y=x0cap2_x1)

  d1_x2 <- seq(1, w, 1)
  xy2_x2 <- data.frame(x=d1_x2, y=x0cap2_x2)

  df_x1 <- rbind(xy1_x1, xy2_x1, set3_x1, set4_x1)

  colors <- c("Original Data" = "red", "Fitted and Predicted Data" = "blue", "Lower Bound CI" = "green", "Upper Bound CI" = "yellow")
  CI <- c(n:w)

  x=y=NULL

  p_x1 <- ggplot(df_x1) +
    theme_bw() +
    labs(title = model,x = 'Number of observation',y = 'Data Forecast & Prediction') +
    scale_x_continuous(breaks=1:w) +
    scale_y_continuous(labels = scales::comma) +
    geom_point(data = xy1_x1, aes(x = x, y = y), shape = 24, color = "black") +
    geom_point(data = xy2_x1, aes(x = x, y = y), shape = 21, color = "black") +
    geom_point(data = set3_x1, aes(x = CI, y = y), shape = 23, color = "black") +
    geom_point(data = set4_x1, aes(x = CI, y = y), shape = 23, color = "black") +
    geom_line(data = xy1_x1, aes(x = x, y = y,color = "Original Data")) +
    geom_line(data = xy2_x1, aes(x = x, y = y,color = "Fitted and Predicted Data")) +
    geom_line(data = set3_x1, aes(x = CI, y = y,color = "Lower Bound CI"), linetype=2) +
    geom_line(data = set4_x1, aes(x = CI, y = y,color = "Upper Bound CI"), linetype=2) +
    scale_color_manual(name = "Label",values = colors)
  r <- ggplotly(p_x1)

  return(r)

}



