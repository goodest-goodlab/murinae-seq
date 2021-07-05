############################################################
# For rodent web, 01.20
# This generates the file "trees.html"
############################################################

#options(nwarnings = 100000)
tree_type = "concat"

cat("Rendering trees-", tree_type, ".rmd/html\n", sep="")

setwd("C:/bin/murinae-seq/docs/scripts/generators/")
# Set the working directory.

vroom_tmp_dir = "C:/bin/murinae-seq/docs/scripts/generators/tmp/"
cat(" -> Creating vroom tmp dir:", vroom_tmp_dir, "\n")
dir.create(vroom_tmp_dir)
Sys.setenv(VROOM_TEMP_PATH = vroom_tmp_dir)
# Handle the vroom tmp directory

Sys.setenv(RSTUDIO_PANDOC="C:/Program Files/RStudio/bin/pandoc/")
# Set the pandoc path

library(rmarkdown)
# Load markdown

output_dir = "../.."
# Set the output directory to be the docs directory, two up

output_file = paste("trees-", tree_type, ".html", sep="")

render("../markdown/trees.rmd", output_dir = output_dir, output_file = output_file, params = list(output_dir = output_dir, output_file = output_file, tree_type = tree_type), quiet = TRUE)
# Knit the html page

f = list.files(vroom_tmp_dir, include.dirs = F, full.names = T, recursive = T)
cat(" -> Removing vroom tmp files:", f, "\n")
#file.remove(f)
unlink(vroom_tmp_dir, recursive=TRUE, force=TRUE)
# Remove the vroom tmp directory
