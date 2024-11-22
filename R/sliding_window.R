source("R/load.R")


# TODO make R for plotting, and source it here
calc_window_mean <- function(inwindow, threshold) {
  curr <- inwindow[1]$euclidean
  avg <- mean(inwindow$euclidean)

  if ((curr-avg) >= threshold | (abs(curr-avg) >= threshold)) {
    return(avg)
  } else {
    return(curr)
  }
}

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

  # add plot wrapper
  return(dt) # change to plot
}
