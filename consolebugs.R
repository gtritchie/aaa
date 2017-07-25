library(crayon)

show_expected <- function(expected) {
  cat("Expect:\n", expected, "\n-----Output starts here:\n", sep="")
}

#################
test1 <- function() {
  show_expected("1\n2\n3\n4\nError in h() : An error! Oh No!")
  message(1)
  message(2)
  message(3)
  message(4)
  Sys.sleep(1)
  g() 
}
g <- function() h()
h <- function() {
  stop("An error! ", "Oh No!")
}
##################
test2 <- function() {
  cat("Expect:\n1\n2\n3\n4\nError in h2() : An error!\n", 
      crayon::red("Oh No!\n"), crayon::bgYellow$red("Wow!"), "\n", sep="")
  message(1)
  message(2)
  message(3)
  message(4)
  Sys.sleep(1)
  g2() 
}
g2 <- function() h2()
h2 <- function() {
   stop("An error!\n", crayon::red("Oh No!\n"), crayon::bgYellow$red("Wow!"))
}
##################
test3 <- function() {
  cat("Hello") 
  cat("World\n")
}
##################
test4 <- function() {
  cat("One\n")
  cat("Two\n")
  cat("Three\n")
  cat("Four\n")
}
####################
test5 <- function() {
  message(1)
  message(2)
  cat("Hello ")
  cat("world\n")
  message(3)
}
#####################
test6 <- function() {
  message(1)
  message(2)
  message(3)
  message(4)
}
#######################
test7a <- function() {
  stop(crayon::green("Hi"))
}

test7 <- function() test7a()
#######################3
test8 <- function() {
   message(1)
   message(2)
   message(3)
   message(4)
   Sys.sleep(1)
   test8a() 
}
test8a <- function() test8b()
test8b <- function() {
   stop("An error!\n", crayon::red("Oh No!\n"), 
        crayon::bgYellow$red("A multiline error with colors.\n"),
        crayon::inverse("And some inverse text.\n"),
        crayon::bold$italic("The Horror!!"))
}
#####################
multi_err <- function() {
  message("Hello")
  stop("A\nB\nC")
}
test9 <- function() multi_err()
######################
test10 <- function() {
   cat("\rfoobar", sep = "")
   cat("\r", "X", " ", "foobar", "\n", sep="")
}
#######################
test11 <- function() {
   cat("\rfoobar", sep = "")
   cat("\r", crayon::green("X"), " ", crayon::red("foobar"), "\n", sep="")
}
#######################
test12 <- function() {
   cat("Hello\nWorld", sep = "")
   cat("\r", crayon::green("X"), " ", crayon::red("Y"), "\n", sep="")
}
#######################
test13 <- function() {
   cat("Hello\nWorld", sep = "")
   cat("\r", crayon::green("123"), crayon::red("45"), "\n", sep="")
}

testbox <- function() {
  cat(crayon::inverse("╔═══════════╗\n"))
  cat(crayon::inverse("║ Before    ║\n"))
  cat(crayon::inverse("╚═══════════╝\n\n"))
  
  cat(crayon::inverse("\033[19m╔═══════════╗\n"))
  cat(crayon::inverse("\033[19m║ After     ║\n"))
  cat(crayon::inverse("\033[19m╚═══════════╝\n"))
}
