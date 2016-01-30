# CourseraGettingCleaningData
This is a repository of the code used for the Getting and Cleaning Data Course in the Data Science Specialization by Johns Hopkins University from Coursera

The original data set can be obtained here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Files in this repo
- CodeBook.md -- codebook describing variables, the data and transformations
- run_analysis.R -- actual R code

# Objective of run_analysis.R
You should create one R script called run_analysis.R that does the following: 1. Merges the training and the test sets to create one data set. 2. Extracts only the measurements on the mean and standard deviation for each measurement. 3. Uses descriptive activity names to name the activities in the data set 4. Appropriately labels the data set with descriptive activity names. 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

It should run in a folder of the Samsung data (the zip had this folder: UCI HAR Dataset but I renamed it Samsung) The script assumes it has in it's working directory the following files and folders:

activity_labels.txt
features.txt
test/
train/
The output is created in working directory with the name of grouped_data.txt
