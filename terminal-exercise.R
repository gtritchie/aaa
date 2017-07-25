# exercise the rstudioapi Terminal calls


# sendToTerminal
# clearTerminal
# createTerminal
# isTerminalBusy
# getAllTerminals
# getTerminalContext
# showTerminal
# getTerminalBuffer

exercise_terminal <- function() {
  createTerminal("a")
  showTerminal("a")
  sendToTerminal("echo Hello World!\n", "a")
  status <- getTerminalContext("a")
  View(status)
}
