say <- function(...) cat(sprintf(...), sep='', file=stdout())
cry <- function(...) cat(sprintf(...), sep='', file=stderr())

talkative <- function() {
  for (i in 1:20) {
    say("Hello\n", i)
    cry("Goodbye\n", i)
    Sys.sleep(1)
  } 
}

talkative()
