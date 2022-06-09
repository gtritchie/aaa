tempDir <- tempfile()
dir.create(tempDir)
htmlFile <- file.path(tempDir, "index.html")
writeLines(c("<html><body><p>Hello World</p></body></html>"), htmlFile)
viewer <- getOption("viewer")
viewer(htmlFile)

