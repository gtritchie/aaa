ansi_examples <- function() {
   cat("Normal Text\n")
   cat("\033[1mBold Text\033[22m ")
   cat("\033[4mUnderlined Text\033[24m ")
   cat("\033[7mInverse Text\033[27m ")
   cat("Visible \033[8mHIDDEN\033[28m Visible\n")
   cat("Default \033[30mBlack  \033[31mRed  \033[32mGreen  \033[33mYellow  ") 
   cat("\033[34mBlue  \033[35mMagenta  \033[36mCyan  \033[37mSilver\n") 
   cat("Default \033[90mBlack2 \033[91mRed2 \033[92mGreen2 \033[93mYellow2 ") 
   cat("\033[94mBlue2 \033[95mMagenta2 \033[96mCyan2 \033[97mSilver2\n") 
   cat("Default \033[40mBlack  \033[41mRed  \033[42mGreen  \033[43mYellow  ") 
   cat("\033[44mBlue  \033[45mMagenta  \033[46mCyan  \033[47mSilver\n") 
   cat("Default \033[100mBlack2 \033[101mRed2 \033[102mGreen2 \033[103mYellow2 ") 
   cat("\033[104mBlue2 \033[105mMagenta2 \033[106mCyan2 \033[107mSilver2\n") 
   cat("\033[34m\033[43m\033[1m\033[7mBlue on Yellow, Bold, Inverted\033[0m Default ")    
   cat("\033[3mItalic\033[23m \033[9mStrikethrough\033[29m\n")
  
   # output <- ""
   # for (color2 in 0:255) {
   #    output <- paste(output, "\033[48;5;", color2, "m", "   ", sep="")
   #    if ((color2  + 1) %% 32 == 0) {
   #       output <- paste(output, "\n", sep="")
   #    }
   # }
   #  cat(output, sep="\n") 
  for (color in 0:255) {
     cat("\033[48;5;", color, "m", "  \033[0m", sep="")
     if ((color  + 1) %% 32 == 0) {
        cat("\n")
     }
  }
 }