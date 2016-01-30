## 1. Merges the training and the test sets to create one data set.
# Read in training data
trainData <- read.table("./Samsung/train/X_train.txt")
trainLabel <- read.table("./Samsung/train/y_train.txt")
trainSubject <- read.table("./Samsung/train/subject_train.txt")
# Read in testing data
testData <- read.table("./Samsung/test/X_test.txt")
testLabel <- read.table("./Samsung/test/y_test.txt")
testSubject <- read.table("./Samsung/test/subject_test.txt")
# Read in features data
features <- read.table("./Samsung/features.txt")
# Read in activity data
activity <- read.table("./Samsung/activity_labels.txt")
# Join data together
joinData <- rbind(trainData, testData)
joinLabel <- rbind(trainLabel, testLabel)
joinSubject <- rbind(trainSubject, testSubject)

## 2. Extracts only the measurements on the mean and standard deviation for each 
## measurement.
#Finds the indices of features that are mean or standard deviation
indices <- grep("mean\\(\\)|std\\(\\)", features[,2])
# Subsets joinData at indices
joinData <- joinData[, indices]

## 3. Uses descriptive activity names to name the activities in the data set
# Creates activity label for each number key in joinLabel
activityLabel <- tolower(activity[joinLabel[, 1], 2])
# Cleans up variable name by removing _
activityLabel <- gsub("_u","U",activityLabel)
activityLabel <- sub("_d","D",activityLabel)
# Replaces number key in joinLabel with activity label created above
joinLabel[, 1] <- activityLabel
# Assigns variable name activity to joinLabel
names(joinLabel) <- "activity"

## 4. Appropriately labels the data set with descriptive variable names.
# Assigns measure name from features as variable names in joinData
names(joinData) <- features[indices, 2]
# Cleans up variables names by capitalizing mean and std and removing () and -
names(joinData) <- gsub("\\(\\)", "", names(joinData))
names(joinData) <- gsub("-", "", names(joinData))
names(joinData) <- gsub("mean", "Mean", names(joinData))
names(joinData) <- gsub("std", "Std", names(joinData))
# Assigns variable name subject to joinSubject
names(joinSubject) <- "subject"
# Binds all of the join data together so measurements have a subject key and 
# activity name
cleanData <- cbind(joinSubject, joinLabel, joinData)
# Writes clean data set
write.table(cleanData, "clean_data.txt")

## 5. From the data set in step 4, creates a second, independent tidy data set with 
## the average of each variable for each activity and each subject.
# Uses the aggregate function to group and average
groupedData <- aggregate(cleanData[, 3:ncol(cleanData)], 
                     by=list(subject = cleanData$subject, 
                        activity = cleanData$activity), mean)
# Writes grouped data set
write.table(groupedData, "grouped_data.txt")