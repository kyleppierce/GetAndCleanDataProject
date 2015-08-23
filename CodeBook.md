Study Design (Source Data)
--------
The source data processed by the run_analysis.R script was downloaded from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
on August 20, 2015 at 10:13 PM EDT.

More about the original study that generated the source data can be found at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Transformations
---------------
0. User downloads and unzips the file above in the scrips working directory
1. Combine the Test volunteer, activity and data values into a single test data frame
2. Combine the Training volunteer, activity and data values into a single training data frame
3. Merge the Test data fram and Training dataframe into a single data frame
4. Pull out the volunteer id, activity id, and the mean and standard deviation values for tBodyAcc-XYZ, tGravityAcc-XYZ, and tBodyGyro-XYZ
5. Modify the activity ids into the corresponding human readable names
6. Rename the fields into human readable names
7. Group the values by volunteer and activity and calculate the mean for each of the corresponding variables

Variables
---------
- Volunteer - Volunteer ID number ranging from 1 to 30
- Activity - Type of activity the volunteer was performing during the measurements (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
- tBodyAccMeanX - Time domain representation of average body acceleration in the X direction (standard gravity units 'g')
- tBodyAccMeanY - Time domain representation of average body acceleration in the Y direction (standard gravity units 'g')
- tBodyAccMeanZ - Time domain representation of average body acceleration in the Z direction (standard gravity units 'g')
- tBodyAccStdX - Time domain representation of standard deviation of body acceleration in the X direction (standard gravity units 'g')
- tBodyAccStdY - Time domain representation of standard deviation of body acceleration in the Y direction (standard gravity units 'g')
- tBodyAccStdZ - Time domain representation of standard deviation of body acceleration in the Z direction (standard gravity units 'g')
- tGravityAccMeanX - Time domain representation of gravitational acceleration in the X direction (standard gravity units 'g')
- tGravityAccMeanY - Time domain representation of gravitational acceleration in the Y direction (standard gravity units 'g')
- tGravityAccMeanZ - Time domain representation of gravitational acceleration in the Z direction (standard gravity units 'g')
- tGravityAccStdX - Time domain representation of standard deviation of gravitational acceleration in the X direction (standard gravity units 'g')
- tGravityAccStdY - Time domain representation of standard deviation of gravitational acceleration in the Y direction (standard gravity units 'g')
- tGravityAccStdZ - Time domain representation of standard deviation of gravitational acceleration in the Z direction (standard gravity units 'g')
- tBodyGyroMeanX - Time domain representation of average angular velocity in the X direction (radians/second)
- tBodyGyroMeanY - Time domain representation of average angular velocity in the Y direction (radians/second)
- tBodyGyroMeanZ - Time domain representation of average angular velocity in the Z direction (radians/second)
- tBodyGyroStdX - Time domain representation of standard deviation of angular velocity in the X direction (radians/second)
- tBodyGyroStdY - Time domain representation of standard deviation of angular velocity in the Y direction (radians/second)
- tBodyGyroStdZ - Time domain representation of standard deviation of angular velocity in the Z direction (radians/second)