download run_analysis.R in your RStudio working directory

place the "UCI HAR Dataset" in the working directory as well

load the script into R with source("run_analysis.R")

run the function with run_analysis()

2 files will be created in your working directory. part1.txt and step5.txt (make sure you don't have files with those names or they may be overwritten)

load the file with df <- read.table("part1.txt", header = TRUE)

What the script does:
Part1
#1. Loads each of the necessary files into dataframes and the activities and features are saved as vectors
#2. The test subject data is merged using cbind() and the first 2 columns are renamed to "subject and activity"
#3. The remaining 561 columns are renamed for the particular activities
#4. Steps 2 and 3 are repeated for the "train" subjects.
#5. The 2 data sets are combined with rbind().
#6. The activities factors are changed to their names
#7. The dataframe is written to a file
Part 2
#8. The dataframe from above is grouped by each subject and activity
#9. Each column for each subject is summarised by its mean
#10. The data is written to a file
