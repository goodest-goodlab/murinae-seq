############################################################
# For rodent web, 01.20
# This generates the file "aln_stats.html"
############################################################


cat("Rendering aln_stats.rmd/html\n")
Sys.setenv(RSTUDIO_PANDOC="C:/Program Files/RStudio/bin/pandoc/")
library(rmarkdown)
setwd("C:/bin/murinae-seq/docs/scripts/generators/")
output_dir = "../.."
render("../markdown/aln_stats.rmd", output_dir = output_dir, params = list(output_dir = output_dir), quiet = TRUE)