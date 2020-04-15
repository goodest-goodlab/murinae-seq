############################################################
# For rodent web, 04.20
# This generates the file "mouse_rat_transcripts.html"
############################################################


cat("Rendering mouse_rat_transcripts.rmd/html\n")
Sys.setenv(RSTUDIO_PANDOC="C:/Program Files/RStudio/bin/pandoc/")
library(rmarkdown)
setwd("C:/bin/murinae-seq/docs/scripts/generators/")
output_dir = "../.."
render("../markdown/mouse_rat_transcripts.rmd", output_dir = output_dir, params = list(output_dir = output_dir), quiet = TRUE)