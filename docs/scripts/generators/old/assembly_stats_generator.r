############################################################
# For rodent web, 07.20
# This generates the file "assembly_stats_2.html"
############################################################


cat("Rendering full_assembly_stats.rmd/html\n")
Sys.setenv(RSTUDIO_PANDOC="C:/Program Files/RStudio/bin/pandoc/")
library(rmarkdown)
setwd("C:/bin/murinae-seq/docs/scripts/generators/")
output_dir = "../.."
render("../markdown/assembly_stats_2.rmd", output_dir = output_dir, params = list(output_dir = output_dir), quiet = TRUE)