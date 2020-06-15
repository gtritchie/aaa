library(crayon)
library(progress)

# meaningless comment

show_progress <- function(format, size, width = 80) {
  pb <- progress_bar$new(total = size, format = format, width = width)
  for (i in 1:size) {
    pb$tick()
    Sys.sleep(1 / size)
  }
}

# Works with colors and 1 ms updates
foo1 <- function() {
  show_progress(":bar " %+% green(":rate"), 1000)
}

# Works without colors and .1 ms updates
foo2 <- function() {
  show_progress(":bar " %+% ":rate", 10000)
}

# Doesn't work with colors and .1 ms updates
foo3 <- function() {
  show_progress(":bar " %+% green(":rate"), 10000)
}

say <- function() {
  cat("gary")
}