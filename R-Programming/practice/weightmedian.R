weightmedian <- function (directory, day) {
  # Get the list of files to read with the path included
  files <- list.files(directory, full.names = TRUE)
  # Create an empty data.frame
  dat <- data.frame()
  # Loop through the files ...
  for (f in files) {
    # create a frame whit all data ...
    dat <- rbind(dat, read.csv(f))
  }
  # Get just data of the day ...
  dat_day <- dat[which(dat$Day == day), ]
  # Calculate the median ...
  median(dat_day$Weight, na.rm = TRUE)
}
