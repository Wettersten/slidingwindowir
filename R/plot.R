# plot function, put in plot.R
# TODO - fix colors, make a function, return the plot
p <-
  ggplot2::ggplot(data = dt, aes(x = time, y = euclidean)) +
  scale_x_datetime() +
  # geom_line() +
  # geom_line(aes(y = mean), color = "red") +
  geom_line(data = dt[binary %in% c(-1, 1)], aes(y = binary), color = "blue") +
  cowplot::theme_cowplot() +
  labs(y = "acceleration") +


  p
if (euc_bg) {
  p <- p + geom_line()
}

if (sw_mean) {
  p <- p + geom_line(aes(y = mean), color = "red")
}

if (sw_binary) {
  p <- p + geom_line(aes(y = binary), color = "blue")
  if (sw_mean == FALSE & sw_bg == FALSE) {
    p <- p + scale_y_continuous(limits = c(-1, 1), breaks = c(-1, 1))
  }

}
