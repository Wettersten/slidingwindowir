# This file tests the sliding_window function.
# Reads the test data from inst/extdata/Example_window.csv, runs the mean
# smoothing sliding window algorithm and outputs that plot.

library(slidingwindowir)
sliding_window(infile = "inst/extdata/Example_window.csv", sw_mean = TRUE)
