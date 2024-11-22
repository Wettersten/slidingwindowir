#' Sliding Window Plot
#'
#' Plots the data after algorithms have been applied to smoothen the data.
#' @param indata Takes data in the form of a data.table
#' @param plot_mean Plots the mean line if the algorithm was used
#' @param plot_binary Plots the binary line if the algorithm was used
#' @param plot_bg Plots the background euclidean line if used
#' @return Returns the plot made
sw_plot <- function(indata, plot_mean, plot_binary, plot_bg) {
  p <-
    ggplot2::ggplot(data = indata, aes(x = time, y = euclidean)) +
    scale_x_datetime() +
    cowplot::theme_cowplot() +
    labs(y = "acceleration")

  if (plot_bg) {  # if plotting the background euclidean line
    p <- p + geom_line()
  }

  if (plot_mean) {  # if plotting the mean smoothened line
    p <- p + geom_line(aes(y = mean), color = "red")
  }

  if (plot_binary) {  # if plotting the binary line
    p <- p + geom_line(data = indata[binary %in% c(-1, 1)], aes(y = binary), color = "blue")
    if (plot_mean == FALSE & plot_bg == FALSE) {  # fixes the y axis if the background line is not drawn
      p <- p + scale_y_continuous(limits = c(-1, 1), breaks = c(-1, 1))
    }

  }

  return(p)
}
