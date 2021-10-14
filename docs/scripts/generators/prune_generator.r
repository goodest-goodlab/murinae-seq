############################################################
# For rodent web, 04.20
# This generates the file "prune.html"
############################################################


cat("Rendering prune.rmd/html\n")
Sys.setenv(RSTUDIO_PANDOC="C:/Program Files/RStudio/bin/pandoc/")
library(rmarkdown)
setwd("../generators/")
output_dir = "../.."
render("../markdown/prune.rmd", output_dir = output_dir, params = list(output_dir = output_dir), quiet = TRUE)