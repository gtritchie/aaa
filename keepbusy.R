keepbusy <- function() {
  a <- 0
  while (TRUE) {
    Sys.sleep(3)
    print(a)
    a <- a + 1

    }
}