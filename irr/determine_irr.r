library(readr)

# Set working directory to folder where all R code related to the study is stored
# Note: this path must be changed if the code is used on a different computer
setwd("C:/Users/Sina-/Dropbox/Lehrstuhl/Diss/Auswertung/R")

# Load helper functions
source("transformation_0_1/transform_codes_to_0_1.R")

# Read coded data of the three raters for classes TODO 17 - 20 (for now 19-20)
marc_raw <- read_csv2("irr/input_data/marc_19_20.csv", show_col_types = FALSE)

# Apply transformation rules to coded data 
marc = transform_codes(data.frame(marc_raw, row.names = 1))
View(marc)

# Determine inter-rater reliability using TODO