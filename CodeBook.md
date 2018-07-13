# Codebook

This codebook outlines the various variables that are present in the tidydata.txt dataset

## Identifiers and Descriptions

subject_Id 		: the subject id to differentiate between subjects

activity_type 	: the type of activity being performed

## Variables remaining

Variable                                   | Comments
-------------------------------------------|-----------
timeBodyAccelerometerMeanX                 |  mean of tBodyAcc-X
timeBodyAccelerometerMeanY                 |  mean of tBodyAcc-Y
timeBodyAccelerometerMeanZ                 |  mean of tBodyAcc-Z
timeBodyAccelerometerStdX                  |  std of tBodyAcc-X
timeBodyAccelerometerStdY                  |  std of tBodyAcc-Y
timeBodyAccelerometerStdZ                  |  std of tBodyAcc-Z
timeGravityAccelerometerMeanX              |  mean of tGravityAcc-X
timeGravityAccelerometerMeanY              |  mean of tGravityAcc-Y
timeGravityAccelerometerMeanZ              |  mean of tGravityAcc-Z
timeGravityAccelerometerStdX               |  std of tGravityAcc-X
timeGravityAccelerometerStdY               |  std of tGravityAcc-Y
timeGravityAccelerometerStdZ               |  std of tGravityAcc-Z
timeBodyAccelerometerJerkMeanX             |  mean of tBodyAccJerk-X
timeBodyAccelerometerJerkMeanY             |  mean of tBodyAccJerk-Y
timeBodyAccelerometerJerkMeanZ             |  mean of tBodyAccJerk-Z
timeBodyAccelerometerJerkStdX              |  std of tBodyAccJerk-X
timeBodyAccelerometerJerkStdY              |  std of tBodyAccJerk-Y
timeBodyAccelerometerJerkStdZ              |  std of tBodyAccJerk-Z
timeBodyGyroscopeMeanX                     |  mean of tBodyGyro-X
timeBodyGyroscopeMeanY                     |  mean of tBodyGyro-Y
timeBodyGyroscopeMeanZ                     |  mean of tBodyGyro-Z
timeBodyGyroscopeStdX                      |  std of tBodyGyro-X
timeBodyGyroscopeStdY                      |  std of tBodyGyro-Y
timeBodyGyroscopeStdZ                      |  std of tBodyGyro-Z
timeBodyGyroscopeJerkMeanX                 |  mean of tBodyGyroJerk-X
timeBodyGyroscopeJerkMeanY                 |  mean of tBodyGyroJerk-Y
timeBodyGyroscopeJerkMeanZ                 |  mean of tBodyGyroJerk-Z
timeBodyGyroscopeJerkStdX                  |  std of tBodyGyroJerk-X
timeBodyGyroscopeJerkStdY                  |  std of tBodyGyroJerk-Y
timeBodyGyroscopeJerkStdZ                  |  std of tBodyGyroJerk-Z
timeBodyAccelerometerMagMean               |  mean of tBodyAccMag
timeBodyAccelerometerMagStd                |  std of tBodyAccMag
timeGravityAccelerometerMagMean            |  mean of tGravityAccMag
timeGravityAccelerometerMagStd             |  std of tGravityAccMag
timeBodyAccelerometerJerkMagMean           |  mean of tBodyAccJerkMag
timeBodyAccelerometerJerkMagStd            |  std of tBodyAccJerkMag
timeBodyGyroscopeMagMean                   |  mean of tBodyGyroMag
timeBodyGyroscopeMagStd                    |  std of tBodyGyroMag
timeBodyGyroscopeJerkMagMean               |  mean of tBodyGyroJerkMag
timeBodyGyroscopeJerkMagStd                |  std of tBodyGyroJerkMag
frequencyBodyAccelerometerMeanX            |  mean of fBodyAcc-X
frequencyBodyAccelerometerMeanY            |  mean of fBodyAcc-Y
frequencyBodyAccelerometerMeanZ            |  mean of fBodyAcc-Z
frequencyBodyAccelerometerStdX             |  std of fBodyAcc-X
frequencyBodyAccelerometerStdY             |  std of fBodyAcc-Y
frequencyBodyAccelerometerStdZ             |  std of fBodyAcc-Z
frequencyBodyAccelerometerJerkMeanX        |  mean of fBodyAccJerk-X
frequencyBodyAccelerometerJerkMeanY        |  mean of fBodyAccJerk-Y
frequencyBodyAccelerometerJerkMeanZ        |  mean of fBodyAccJerk-Z
frequencyBodyAccelerometerJerkStdX         |  std of fBodyAccJerk-X
frequencyBodyAccelerometerJerkStdY         |  std of fBodyAccJerk-Y
frequencyBodyAccelerometerJerkStdZ         |  std of fBodyAccJerk-Z
frequencyBodyGyroscopeMeanX                |  mean of fBodyGyro-X
frequencyBodyGyroscopeMeanY                |  mean of fBodyGyro-Y
frequencyBodyGyroscopeMeanZ                |  mean of fBodyGyro-Z
frequencyBodyGyroscopeStdX                 |  mean of fBodyGyro-X
frequencyBodyGyroscopeStdY                 |  std of fBodyGyro-Y
frequencyBodyGyroscopeStdZ                 |  std of fBodyGyro-Z
frequencyBodyAccelerometerMagMean          |  mean of fBodyAccMag
frequencyBodyAccelerometerMagStd           |  std of fBodyAccMag
frequencyBodyBodyAccelerometerJerkMagMean  |  mean of fBodyBodyAccJerkMag
frequencyBodyBodyAccelerometerJerkMagStd   |  std of fBodyBodyAccJerkMag
frequencyBodyBodyGyroscopeMagMean          |  mean of fBodyBodyGyroMag
frequencyBodyBodyGyroscopeMagStd           |  std of fBodyBodyGyroMag
frequencyBodyBodyGyroscopeJerkMagMean      |  mean of fBodyBodyGyroJerkMag
frequencyBodyBodyGyroscopeJerkMagStd       |  std of fBodyBodyGyroJerkMag


Transformations
---------------

1. Dataset was initially split into subject, activity, and features. Each of these were further split into test and train sets. Merging was performed to get everything in one dataset.

2. Dataset activity variable was merged with the activity lookup table to yield descriptive activity name.

3. Features were filtered to only those matching mean() or std(). Dataset was merged with derived feature code lookup table to get featureName.

4. Datset was melted with subject, activity, and feature as id variables.

5. An average was added per group of subject, activity, and feature

6. Since this is a TIDY data set, new descriptive columns were created to represent specific variables from the single feature variable (Domain,Instrument,Acceleration,StatVariable,Jerk,Magnitude and Axis) using grepl. The original feature is now redundant and removed.

7. The dataset is then written to `tidy.txt` file
