huge <- function() {
  for (line in 0:1000) {
    cat("Line ", line, ": ", sep="")
    for (col in 0:40000) {
      cat("x", sep="") 
    }
    cat("***\n", sep="")
  }
  cat("Done!\n")
}