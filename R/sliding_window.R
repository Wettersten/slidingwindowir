source("R/load.R")



infile <- "inst/extdata/Example_window.csv"
df <- load_dt(infile)

ggplot2::ggplot(data = df, aes(x = time, y = X)) +
  scale_x_datetime(breaks = 8) +
  geom_line()

class(df$time)
