library(crayon)

show_expected <- function(expected) {
  cat("----Expect:\n", expected, "\n-----Output starts here:\n", sep="")
}

#################
test1 <- function() {
  show_expected("1\n2\n3\n4\nError in h() : An error! Oh No!")
  message(1)
  message(2)
  message(3)
  message(4)
  g() 
}
g <- function() h()
h <- function() {
  stop("An error! ", "Oh No!")
}
##################
test2 <- function() {
  show_expected(c("1\n2\n3\n4\nError in h2() : An error!\n", 
      crayon::red("Oh No!\n"), crayon::bgYellow$red("Wow!")))
  message(1)
  message(2)
  message(3)
  message(4)
  g2() 
}
g2 <- function() h2()
h2 <- function() {
   stop("An error!\n", crayon::red("Oh No!\n"), crayon::bgYellow$red("Wow!"))
}
##################
test3 <- function() {
  show_expected("HelloWorld")
  cat("Hello") 
  cat("World\n")
}
##################
test4 <- function() {
  show_expected("One\nTwo\nThree\nFour")
  cat("One\n")
  cat("Two\n")
  cat("Three\n")
  cat("Four\n")
}
####################
test5 <- function() {
  show_expected("1\n2\nHello world\n3")
  message(1)
  message(2)
  cat("Hello ")
  cat("world\n")
  message(3)
}
#####################
test6 <- function() {
  show_expected("1\n2\n3\n4")
  message(1)
  message(2)
  message(3)
  message(4)
}
#######################
test7a <- function() {
  show_expected(c("Error in test7a() : ", crayon::green("Hi")))
  stop(crayon::green("Hi"))
}

test7 <- function() test7a()
#######################3
test8 <- function() {
  show_expected(c("1\n2\n3\n4\nError in test8b() : ",
                  "An error!\n",
                  crayon::red("Oh No!\n"),
                  crayon::bgYellow$red("A multiline error with colors.\n"),
                  crayon::inverse("And some inverse text.\n"),
                  crayon::bold$italic("The Horror!!")))
  message(1)
  message(2)
  message(3)
  message(4)
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
  show_expected("Hello\nError in multi_err() : A\nB\nC")
  message("Hello")
  stop("A\nB\nC")
}
test9 <- function() multi_err()
######################
test10 <- function() {
  show_expected("X foobar")
  cat("\rfoobar", sep = "")
  cat("\r", "X", " ", "foobar", "\n", sep="")
}
#######################
test11 <- function() {
  show_expected(c(crayon::green("X"), " ", crayon::red("foobar")))  
  cat("\rfoobar", sep = "")
  cat("\r", crayon::green("X"), " ", crayon::red("foobar"), "\n", sep="")
}
#######################
test12 <- function() {
  show_expected(c("Hello\n", crayon::green("X"), " ", crayon::red("Y"), "ld"))
  cat("Hello\nWorld", sep = "")
  cat("\r", crayon::green("X"), " ", crayon::red("Y"), "\n", sep="")
}
#######################
test13 <- function() {
  show_expected(c("Hello\n", crayon::green("123"), crayon::red("45")))
  cat("Hello\nWorld", sep = "")
  cat("\r", crayon::green("123"), crayon::red("45"), "\n", sep="")
}
####################
test14 <- function() {
  show_expected("Beginning\n1\n2\nHello world\n3\nEND")
  cat("Beginning\n")
  message(1)
  message(2)
  cat("Hello ")
  cat("world\n")
  message(3)
  cat("END")
}
#################
test15 <- function() {
  show_expected("1\n2\nError in h15() : A multiline error without colors!\nOh No!")
  message("1")
  message("2")
  g15() 
}
g15 <- function() h15()
h15 <- function() {
  stop("A multiline error without colors!\n", "Oh No!")
}
######################
test16 <- function() {
  show_expected("one\ntwo\nthree")
  cat("one\n")
  cat("two\n")
  cat("three")
}
#####################
f1 <- function() {
  cat("✔ xxx", crayon::blue("yyy"), "xxx")
  cat("\r")
  cat("✔xxx", crayon::red("yyy"), "zzz")
  cat("\n")
}
f2 <- function() {
  cat("✔ xxx", crayon::blue("yyy"), "xxx")
  cat("\r")
  cat("✔ xxx", crayon::red("yyy"), "zzz")
  cat("\n")
}
test17 <- function() {
  show_expected(c("✔xxx ", crayon::red("yyy"), " zzzx\n\n",
                  "✔ xxx ", crayon::red("yyy"), " zzz"))
  f1()
  cat("\n")
  f2()
}
#####################
test18 <- function() {
    show_expected("Message")
    str <- c(
    "B", "\033[31m", "x", "\033[39m", "A",
    "\r   ",
    "\rMessage\n"
  )
  cat(str, sep = "")
}