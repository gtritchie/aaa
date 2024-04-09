# from https://github.com/rstudio/rstudio/issues/14297
#
# Source this, then source the temp file it generates

# tmpfile <- tempfile(fileext = ".R")
tmpfile <- '/Users/garyritchie/scratch/markers.R'
writeLines(con = tmpfile,
           'foo <- cli::bg_br_white(cli::col_red("I am red!"))
bar <- cli::bg_br_yellow(cli::col_cyan("I am cyan!"))

markers <- list(
  list(
    type = "error",
    file = tmpfile,
    line = 6,
    column = 1,
    message = foo),
  list(
    type = "info", 
    file = tmpfile,
    line = 12,
    column = 1,
    message = bar))

rstudioapi::sourceMarkers("Test Name", markers)
'
)

file.edit(tmpfile)