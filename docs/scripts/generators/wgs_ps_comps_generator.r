############################################################
# For rodent web, 07.21
# This generates the file "wgs_ps_comps.html"
############################################################


cat("Rendering wgs_ps_comps.rmd/html\n")
Sys.setenv(RSTUDIO_PANDOC="C:/Program Files/RStudio/bin/pandoc/")
library(rmarkdown)
setwd("C:/bin/murinae-seq/docs/scripts/generators/")
output_dir = "../.."
render("../markdown/wgs_ps_comps.rmd", output_dir = output_dir, params = list(output_dir = output_dir), quiet = TRUE)