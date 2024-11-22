#' Load Data Table
#'
#' Loads the data to be used in the sliding window, does nothing if file
#' does not exist.
#'
#' @param infile Path to data to read in
#' @return Returns data in data.table format
load_dt <- function(infile) {
  # check if the file exists
  if (file.exists(infile)) {
    in_dt <- data.table::fread(infile)

    # change the time format to POSIXct, then extract the times
    in_dt$time <- as.POSIXct(in_dt$time, origin = "1960-01-01")

    # add the euclidean norm column
    in_dt$euclidean <- sqrt(in_dt[[3]]^2 + in_dt[[4]]^2 + in_dt[[5]]^2)

    # add the mean and binary columns
    in_dt[, "mean"] <- in_dt$euclidean
    in_dt$binary <- 0

    return(in_dt)
  }
}
