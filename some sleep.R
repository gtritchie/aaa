moreSleepy <- function(iteration, count) {
  for (i in 1:count) {
    cat(iteration)
    cat(":")
    cat(i)
    cat("\n")
    Sys.sleep(1)
  } 
}
 
sleepy <- function(count) {
  for (i in 1:count) {
    moreSleepy(i, count)
    Sys.sleep(1)
  }  
}

sleepy(1)
sleepy(2)
sleepy(3)
