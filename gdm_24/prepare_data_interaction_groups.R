##### This file is to prepare data for groups 1 and 2 (without and with interaction) #####


library(readr)
library(tidyverse)

# Set working directory to folder where all R code related to the study is stored
setwd("C:/Users/Sina-/Dropbox/Lehrstuhl/Diss/Auswertung/R")

# Load helper functions
source("helper_functions/transform_codes_to_0_1.R")
source("helper_functions/evaluate_mc_tasks.R")

# Read coded data of classes 13-20 as coded by Felix
data_raw = data.frame(read_csv2("gdm_24/input_data/felix_raw_13-20.csv", show_col_types = FALSE), row.names = 1)
data = transform_codes(data_raw)
row.names(data) = rownames(data_raw)

# TODO: muss noch sauber gemacht werden. Für erste werden jetzt alle unklaren Einträge durch 0 ersetzt
data[data != "1" & data != "0" & data != "na"] = "0"


# Evaluate multiple choice tasks to one score
data = evaluate_mc_tasks(data)


# Um nur die Dimension Interaktivität zu unterscheiden, betrachte die Treatmentgruppen 1 und 2 (Code beginnt mit 1 oder 2)
data_interact = data.frame()

for (i in 1:nrow(data)) {
  if (substring(rownames(data)[i],1,1) %in% c("1","2")) {
    data_interact = rbind(data_interact, data[i, ])
  }
}

colnames(data_interact) = colnames(data)

# TODO: Why are colnames still wrong even though they were renamed in evaluate_mc_tasks????
write.csv2(data_interact, file = "gdm_24/output_data/class13-20_gruppe_1_2.csv")
