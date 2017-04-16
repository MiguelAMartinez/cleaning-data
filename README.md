# Getting and Cleaning Data Project
The goal of this project was to collect and clean a set of raw data to produce a tidy data table for later analysis. 

The raw data was obtained from the [UCI archive](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Use the script
To run the script `run_analysis.R`, which contains all the data collection and cleaning code, simply enter `source("run_analysis.R")` in the R console. To read the tidy data frame containing the average of each variable for each activity and each subject, enter `dataTable <- read.table("tidyDataTable.txt", header = TRUE)` in the R console. If you are on a Mac, then enter `View(dataTable)` to view the data table with XQuartz.

This is a preview of the final tidy data table (the table is too big to fully fit on one screenshot, it is necessary to use the keyboard arrows to navigate it):

![Alt text](/img.png?raw=true "Optional Title")

The file `CodeBook.md` contains the description of each variable and the work performed to collect and clean the data.