
testbox <- function() {
  cat(crayon::inverse("╔═══════════╗\n"))
  cat(crayon::inverse("║ Before    ║\n"))
  cat(crayon::inverse("╚═══════════╝\n\n"))
  
  cat(crayon::inverse("\033[19m╔═══════════╗\n"))
  cat(crayon::inverse("\033[19m║ After     ║\n"))
  cat(crayon::inverse("\033[19m╚═══════════╝\n"))
}
