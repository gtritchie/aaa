sleepy <- function(count) {
  for (i in 1:count) {
    cat(i)
    cat("\n")
    Sys.sleep(1)
  }  
}
