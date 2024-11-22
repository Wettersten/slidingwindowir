#' Calculate Sliding Window Mean
#'
#' Calculates the sliding window smoothing for a window, based on the mean
#' acceleration of the window and the threshold.
#'
#' @param inwindow A window, sub-data.table of the main data.table
#' @param threshold A threshold
#' @return Returns mean acceleration of window if the difference in acceleration
#' between the first element and the mean of the window is greater than or equal
#' to threshold, otherwise returns the first element
calc_window_mean <- function(inwindow, threshold) {
  curr <- inwindow[1]$euclidean
  avg <- mean(inwindow$euclidean)

  if ((curr-avg) >= threshold | (abs(curr-avg) >= threshold)) {
    return(avg)
  } else {
    return(curr)
  }
}

#' Calculate Sliding Window Binary
#'
#' Calculates the sliding window smoothing for a window, returning binary +1/-1
#' depending on if the acceleration has increased in the window or decreased.
#' Calculated as increase if the mean of the window is higher than the first
#' element and vice versa for deacceleration.
#'
#' @param inwindow A window, sub-data.table of the main data.table
#' @return +1 if acceleration, -1 if deacceleration
calc_window_binary <- function(inwindow) {
  curr <- inwindow[1]$euclidean
  avg <- mean(inwindow$euclidean)

  if (curr > avg){
    return(1)
  } else if (curr < avg) {
    return(-1)
  } else {
    return(NA)
  }
}

#' Sliding Window
#'
#' Performs the sliding window algorithm, using the chosen input variables.
#' Takes input csv data, with x, y and z coordinates on columns 3, 4 and 5
#' respectively. These are transformed to the euclidean norm and used to
#' smoothen the data with according to the acceleration and algorithm used.
#' Returns a plot of acceleration vs time for the data.
#'
#' @param infile Path to data file
#' @param sw_mean Using mean smoothing algorithm, default FALsE
#' @param sw_binary Using binary smoothing algorithm, default FALSE
#' @param threshold A threshold to compare acceleration with, default 0.5
#' @param window_size Size of window used for window sliding, default 1000
#' @param euc_bg Plots the background euclidean vs time line, default TRUE
#' @return Returns the plot with the chosen sliding window algorithms
#' @export
sliding_window <- function(infile,
                           sw_mean = FALSE,
                           sw_binary = FALSE,
                           threshold = 0.5,
                           window_size = 1000,
                           euc_bg = TRUE) {

  dt <- load_dt(infile)  # load the data

  # iterate over the data, using window size
  for (i in 1:(length(dt$V1)-window_size)) {
    window <- dt[i:(i+window_size-1)]

    # calculate smooth by mean with threshold
    if (sw_mean) {
      dt[i]$mean <- calc_window_mean(window, threshold)
    }

    # add binary if acceleration increase/decrease
    if (sw_binary) {
      dt[i]$binary <- calc_window_binary(window)
    }
  }

  # plot the data with the given functions
  p <- sw_plot(indata = dt,
               plot_mean = sw_mean,
               plot_binary = sw_binary,
               plot_bg = euc_bg)

  p
}
