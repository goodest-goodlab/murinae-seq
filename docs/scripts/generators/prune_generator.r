############################################################
# For rodent web, 04.20
# This generates the file "prune.html"
############################################################

tree_type = "concat"

cat("Rendering prune-", tree_type, ".rmd/html\n", sep="")

setwd("../generators/")
# Set the working directory.

Sys.setenv(RSTUDIO_PANDOC="C:/Program Files/RStudio/bin/pandoc/")
# Set the pandoc path

library(rmarkdown)
# Load markdown

output_dir = "../.."
# Set the output directory to be the docs directory, two up

output_file = paste("prune-", tree_type, ".html", sep="")

render("../markdown/prune.rmd", output_dir = output_dir, output_file = output_file, params = list(output_dir = output_dir, output_file = output_file, tree_type = tree_type), quiet = TRUE)
# Knit the html page