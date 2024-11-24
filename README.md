Sliding window package for the Intermediate R course.

Usage:
```
sliding_window(infile = "path/to/data.csv",
               sw_mean = FALSE,
               sw_binary = FALSE,
               threshold = 0.5,
               window_size = 1000,
               euc_bg = TRUE)
```
`infile` Requires input in the format of csv/tsv, columns 3-5 need to be the x, y and z coordinates, respectively.

`sw_mean` Default: FALSE, performs mean smoothing sliding window algorithm and displays plot.

`sw_binary` Default: FALSE, performs binary sliding window algorithm and displays plot.

`threshold` Default: 0.5, threshold for the mean smoothing algorithm where acceleration above, or equal to, is smoothed.

`window_size` Default: 1000, window size for the sliding window algorithms.

`euc_bg` Displays the euclidean by time plot for the data as background.
