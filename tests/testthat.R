#' Test Sliding Window Mean
#'
#' Test example, running sliding window using the mean algorithm on provided
#' data. Displays plot.
test_mean <- function() {
  infile = "inst/extdata/Example_window.csv"
  sliding_window(infile, sw_mean = TRUE)
}

#' Test Sliding Window Binary
#'
#' Test example, running sliding window using the binary algorithm on provided
#' data. Displays plot.
test_binary <- function() {
  infile = "inst/extdata/Example_window.csv"
  sliding_window(infile, euc_bg = FALSE, sw_binary = TRUE)
}

#' Test Sliding Window Both
#'
#' Test example, running sliding window using the mean and the binary algorithm
#' on provided data. Displays plot.
test_both <- function() {
  infile = "inst/extdata/Example_window.csv"
  sliding_window(infile, sw_mean = TRUE, sw_binary = TRUE)
}

# Runs the test for Mean
test_mean()
# Runs the test for Binary
test_binary()
# Runs the test for both
test_both()
