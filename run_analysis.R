## 1. Merges the training and the test sets to create one data set

# contanate data tables by row
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity <- rbind(dataActivityTrain, dataActivityTest)
dataFeatures <- rbind(dataFeaturesTrain, dataFeaturesTest)

# set names to variables
names(dataSubject) <- c("subject")
names(dataActivity) <- c("activity")
dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"), head=FALSE)
names(dataFeatures) <- dataFeaturesNames$V2

# Merge columns to get the data frame "Data" for all data
dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine)


##########################################################################


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# Subset Name of Features by measurements on the mean and standard deviation
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]

# Subset the data frame Data by seleted names of Features
selectedNames <- c(as.character(subdataFeaturesNames), "subject", "activity" )
Data <- subset(Data, select = selectedNames)


##########################################################################


## 3. Uses descriptive activity names to name the activities in the data set

activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)


##########################################################################

## 4. Appropriately labels the data set with descriptive variable names. 

names(Data) <- gsub("^t", "time", names(Data))
names(Data) <- gsub("^f", "frequency", names(Data))
names(Data) <- gsub("Acc", "Accelerometer", names(Data))
names(Data) <- gsub("Gyro", "Gyroscope", names(Data))
names(Data) <- gsub("Mag", "Magnitude", names(Data))
names(Data) <- gsub("BodyBody", "Body", names(Data))


##########################################################################


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
##    for each activity and each subject.

library(plyr);
Data2 <- aggregate(. ~subject + activity, Data, mean)
Data2 <- Data2[order(Data2$subject, Data2$activity),]
write.table(Data2, file = "tidydata.txt", row.name = FALSE)


