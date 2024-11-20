# TODO - documentation loading file
load_dt <- function(infile) {
  # check if the file exists
  if (file.exists(infile)) {
    in_dt <- data.table::fread(infile)

    # change the time format to POSIXct, then extract the times
    in_dt$time <- as.POSIXct(in_dt$time, origin = "1960-01-01")

    # add the Euclidean norm (sqrt(x^2 + y^2 + z^2)) as X
    in_dt$X <- sqrt(in_dt$x^2 + in_dt$y^2 + in_dt$z^2)

    return(in_dt)
  }
}
