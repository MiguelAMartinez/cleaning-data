#run_analysis.R
#source("run_analysis.R")
#install.packages("plyr")
library(plyr)
library(dplyr)

# Read train and test tables
testSubject <-read.table("./test/subject_test.txt")
testActivity <-read.table("./test/y_test.txt")
testData <-read.table("./test/X_test.txt")
trainSubject <-read.table("./train/subject_train.txt")
trainActivity <-read.table("./train/y_train.txt")
trainData <-read.table("./train/X_train.txt")

# Rename columns 
testSubject <- rename(testSubject, Subject = V1)
testActivity <- rename(testActivity, Activity = V1)
trainSubject <- rename(trainSubject, Subject = V1)
trainActivity <- rename(trainActivity, Activity = V1)

# Merge data frames
testList = list(testSubject,testActivity,testData)
testDataFrame <- Reduce(merge, lapply(testList, function(x) data.frame(x, rn = row.names(x))))
testDataFrame$rn <- NULL
trainList = list(trainSubject,trainActivity,trainData)
trainDataFrame <- Reduce(merge, lapply(trainList, function(x) data.frame(x, rn = row.names(x))))
trainDataFrame$rn <- NULL
mergedDataFrame <- rbind(testDataFrame,trainDataFrame)

# Extract mean and standard deviation measurements
features <- read.table("features.txt")
extractedValues <- grepl("(\\mean()\\b)|(std())", features$V2)
extractedColumns <- c(TRUE, TRUE, extractedValues)
extractedDataFrame <- mergedDataFrame[,extractedColumns]

# Rename activities using descriptive names
renamedDataFrame <- extractedDataFrame
renamedDataFrame$Activity <- as.character(renamedDataFrame$Activity)
renamedDataFrame$Activity <- gsub("1","Walking", renamedDataFrame$Activity)
renamedDataFrame$Activity <- gsub("2","WalkingUpstairs", renamedDataFrame$Activity)
renamedDataFrame$Activity <- gsub("3","WalkingDownstairs", renamedDataFrame$Activity)
renamedDataFrame$Activity <- gsub("4","Sitting", renamedDataFrame$Activity)
renamedDataFrame$Activity <- gsub("5","Standing", renamedDataFrame$Activity)
renamedDataFrame$Activity <- gsub("6","Laying", renamedDataFrame$Activity)

# Labels the data set with descriptive variable names
extractedFeatures <- features[extractedValues,]
extractedFeaturesNames <- as.character(extractedFeatures$V2)
namesFeatures <- c("Subject","Activity",extractedFeaturesNames)
namesFeatures <- gsub("-","", namesFeatures)
namesFeatures <- gsub("mean","Mean", namesFeatures)
namesFeatures <- gsub("std","Std", namesFeatures)
namesFeatures <- gsub("\\()\\b","", namesFeatures)
colnames(renamedDataFrame) <- namesFeatures

# Create second tidy data frame with average of each variable grouped by Subject and Activity
tidyDataFrame <- renamedDataFrame %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
write.table(tidyDataFrame, file = "tidyDataTable.txt", row.name=FALSE)

# To read table
# dataTable <- read.table("tidyDataTable.txt", header = TRUE)
# To view with XQuartz on Mac
# View(dataTable)

