% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sliding_window.R
\name{sliding_window}
\alias{sliding_window}
\title{Sliding Window}
\usage{
sliding_window(
  infile,
  sw_mean = FALSE,
  sw_binary = FALSE,
  threshold = 0.5,
  window_size = 1000,
  euc_bg = TRUE
)
}
\arguments{
\item{infile}{Path to data file}

\item{sw_mean}{Using mean smoothing algorithm, default FALsE}

\item{sw_binary}{Using binary smoothing algorithm, default FALSE}

\item{threshold}{A threshold to compare acceleration with, default 0.5}

\item{window_size}{Size of window used for window sliding, default 1000}

\item{euc_bg}{Plots the background euclidean vs time line, default TRUE}
}
\value{
Returns the plot with the chosen sliding window algorithms
}
\description{
Performs the sliding window algorithm, using the chosen input variables.
Takes input csv data, with x, y and z coordinates on columns 3, 4 and 5
respectively. These are transformed to the euclidean norm and used to
smoothen the data with according to the acceleration and algorithm used.
Returns a plot of acceleration vs time for the data.
}
