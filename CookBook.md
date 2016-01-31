# Variables
##subject
A subject id from 1-30 representing an human subject
##activity
An activity label that describes the type of activity being recorded. 
Activities are "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING","STANDING", and "LAYING"
##measurements
The following variables are measurement variables described in the data section below.
Measures are tbodyaccmeanx, tbodyaccmeany, tbodyaccmeanz, tbodyaccstdx, tbodyaccstdy, tbodyaccstdz, tgravityaccmeanx, tgravityaccmeany, tgravityaccmeanz, tgravityaccstdx, tgravityaccstdy, tgravityaccstdz, tbodyaccjerkmeanx, tbodyaccjerkmeany, tbodyaccjerkmeanz, tbodyaccjerkstdx, tbodyaccjerkstdy, tbodyaccjerkstdz, tbodygyromeanx, tbodygyromeany, tbodygyromeanz, tbodygyrostdx, tbodygyrostdy, tbodygyrostdz, tbodygyrojerkmeanx, tbodygyrojerkmeany, tbodygyrojerkmeanz, tbodygyrojerkstdx, tbodygyrojerkstdy, tbodygyrojerkstdz, tbodyaccmagmean, tbodyaccmagstd, tgravityaccmagmean, tgravityaccmagstd, tbodyaccjerkmagmean, tbodyaccjerkmagstd, tbodygyromagmean, tbodygyromagstd, tbodygyrojerkmagmean, tbodygyrojerkmagstd, fbodyaccmeanx, fbodyaccmeany, fbodyaccmeanz, fbodyaccstdx, fbodyaccstdy, fbodyaccstdz, fbodyaccjerkmean, fbodyaccjerkmeany, fbodyaccjerkmeanz, fbodyaccjerkstdx, fbodyaccjerkstdy, fbodyaccjerkstdz, fbodygyromeanx, fbodygyromeany, fbodygyromeanz, fbodygyrostdx, fbodygyrostdy, fbodygyrostdz, fbodyaccmagmean, fbodyaccmagstd, fbodybodyaccjerkmagmean, fbodybodyaccjerkmagstd, fbodybodygyromagmean, fbodybodygyromagstd, fbodybodygyrojerkmagmean, fbodybodygyrojerkmagstd
# Data
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tbodyacc-xyz

tgravityacc-xyz

tbodyaccjerk-xyz

tbodygyro-xyz

tbodygyrojerk-xyz

tbodyaccmag

tgravityaccmag

tbodyaccjerkmag

tbodygyromag

tbodygyrojerkmag

fbodyacc-xyz

fbodyaccjerk-xyz

fbodygyro-xyz

fbodyaccmag

fbodyaccjerkmag

fbodygyromag

fbodygyrojerkmag

The set of variables that were estimated from these signals are:

mean: Mean value

std: Standard deviation
# Transformation
The run_analysis.R script performs the following steps to clean the data:
- Read X_train.txt, y_train.txt and subject_train.txt from the "./Samsung/train" folder and store them in trainData, trainLabel and trainSubject variables respectively.
- Read X_test.txt, y_test.txt and subject_test.txt from the "./Samsung/test" folder and store them in testData, testLabel and testsubject variables respectively.
- Read features.txt and activity_labels.txt from the "./Samsung" folder and store them in features and activities variables resepctively.
- Concatenate testData to trainData to generate a 10299x561 data frame, joinData; concatenate testLabel to trainLabel to generate a 10299x1 data frame, joinLabel; concatenate testSubject to trainSubject to generate a 10299x1 data frame, joinSubject.
- Find the indicies where features are measures of mean or standard deviation and subset the joinData on those indices

