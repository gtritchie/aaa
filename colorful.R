
colorful <- function() {
  for (color in 0:255){
    cat("\033[48;5;", color, "m", color, "\n", sep="")
  }
}

colorful()
