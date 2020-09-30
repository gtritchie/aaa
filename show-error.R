f1 <- function() {
  stop("Inspect me.")
}

f2 <- function() {
  f1()
}

f2()
