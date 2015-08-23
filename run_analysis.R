# Dependancies
library(data.table)

# File Variables
datasetDir = paste(".", "UCI HAR Dataset", sep="/")
testDir = paste(datasetDir, "test", sep="/")
trainDir = paste(datasetDir, "train", sep="/")

# Read Files
# testDF = data.frame(read.table(paste(testDir, "subject_test.txt", sep="/")), read.table(paste(testDir, "y_test.txt", sep="/")), read.table(paste(testDir, "X_test.txt", sep="/")))
# trainDF = data.frame(read.table(paste(trainDir, "subject_train.txt", sep="/")), read.table(paste(trainDir, "y_train.txt", sep="/")), read.table(paste(trainDir, "X_train.txt", sep="/")))

# Merge the training and the test sets to create one data set.
df = rbind(trainDF, testDF)

# Extract only the measurements on the mean and standard deviation for each measurement. 
df = df[,c('V1','V1.1',
           'V1.2','V2','V3','V4','V5','V6',
           'V41','V42','V43','V44','V45','V46',
           'V121','V122','V123','V124','V125','V126'
        )]

# Uses descriptive activity names to name the activities in the data set
df$V1.1[df$V1.1==1] = 'WALKING'
df$V1.1[df$V1.1==2] = 'WALKING_UPSTAIRS'
df$V1.1[df$V1.1==3] = 'WALKING_DOWNSTAIRS'
df$V1.1[df$V1.1==4] = 'SITTING'
df$V1.1[df$V1.1==5] = 'STANDING'
df$V1.1[df$V1.1==6] = 'LAYING'

# Add Dependency
library(dplyr)

# Label the data set with descriptive variable names. 
df = rename(df,Volunteer=V1,Activity=V1.1,
            tBodyAccMeanX=V1.2,tBodyAccMeanY=V2,tBodyAccMeanZ=V3,tBodyAccStdX=V4,tBodyAccStdY=V5,tBodyAccStdZ=V6,
            tGravityAccMeanX=V41,tGravityAccMeanY=V42,tGravityAccMeanZ=V43,tGravityAccStdX=V44,tGravityAccStdY=V45,tGravityAccStdZ=V46,
            tBodyGyroMeanX=V121,tBodyGyroMeanY=V122,tBodyGyroMeanZ=V123,tBodyGyroStdX=V124,tBodyGyroStdY=V125,tBodyGyroStdZ=V126
        )

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
grouping = group_by(df,Volunteer,Activity)
sm = summarize(grouping, 
          tBodyAccMeanX=mean(tBodyAccMeanX),tBodyAccMeanY=mean(tBodyAccMeanY),tBodyAccMeanZ=mean(tBodyAccMeanZ),tBodyAccStdX=mean(tBodyAccStdX),tBodyAccStdY=mean(tBodyAccStdY),tBodyAccStdZ=mean(tBodyAccStdZ),
          tGravityAccMeanX=mean(tGravityAccMeanX),tGravityAccMeanY=mean(tGravityAccMeanY),tGravityAccMeanZ=mean(tGravityAccMeanZ),tGravityAccStdX=mean(tGravityAccStdX),tGravityAccStdY=mean(tGravityAccStdY),tGravityAccStdZ=mean(tGravityAccStdZ),
          tBodyGyroMeanX=mean(tBodyGyroMeanX),tBodyGyroMeanY=mean(tBodyGyroMeanY),tBodyGyroMeanZ=mean(tBodyGyroMeanZ),tBodyGyroStdX=mean(tBodyGyroStdX),tBodyGyroStdY=mean(tBodyGyroStdY),tBodyGyroStdZ=mean(tBodyGyroStdZ)
          )
write.table(sm,file="output.txt",row.names=FALSE)