# random comment
keepbusy <- function() {
  a <- 0
  while (TRUE) {
    Sys.sleep(1)
    print(a)
    a <- a + 1
    Sys.sleep(2)
    print(a)
    a <- a + 1
  }
}
