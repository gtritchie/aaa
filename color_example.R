# this is something
library(crayon)
options(crayon.enabled=TRUE)
options(crayon.colors=256)
colors <- num_colors(forget=TRUE)

color_example <- function() {
   cat("Normal Text\n")
   cat(bold("Bold Text"), underline("Underlined Text"), inverse("Inverse Text"), 
      "Visible", hidden("Hidden"), "Visible")
   cat("\n")
}
