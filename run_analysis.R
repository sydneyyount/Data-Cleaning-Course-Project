## Run_Analysis.R
## Author: S.Y
## Date: 1/10/21

## Code to download data set:
# fileName <- "DataCleaningProject.zip"
# fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(fileURL, fileName, method="curl")
# unzip(fileName)

## After file is downloaded, use read table to assign all data frames

## Step 1: Merging training and test sets to create one data set

# Combining all X, Y and subject training and test data
XDat <- rbind(x_train,x_test)
YDat<- rbind(y_train,y_test)
SubjectDat <- rbind(subject_train,subject_test)

# Creating a single data set of the merged data
MergedData <- cbind(XDat,YDat,SubjectDat)

## Step 2: Extracts only the measurements on the mean and standard deviation for
##        each measurement

# Finding columns that contain either mean or standard deviation
colMeanSTD <- grep(".*Mean.*|.*Std.*", names(MergedData), ignore.case=TRUE)

# Extracting data using the column indices from above
summaryData <- MergedData[,colMeanSTD]

# adding code and subject information to summaryData
code <- MergedData$code
subject <- MergedData$subject
summaryData <- cbind(summaryData,code,subject)

## Step 3: Uses descriptive activity names to name the activities in the data set

# Changing code numbers into characters
summaryData$code <- as.character(summaryData$code)

# Looping through the code and replacing code with descriptive activity
for (i in 1:6){
  summaryData$code[summaryData$code == i] <- as.character(activities[i,2])
}

# making descriptive activity a factor
summaryData$code <- as.factor(summaryData$code)

## Step 4: Appropriately labels the data set with descriptive variable names
names(summaryData) <- gsub("code","Activity",names(summaryData))
names(summaryData) <- gsub("subject","Subject",names(summaryData))
names(summaryData) <- gsub("Acc","Acceleration",names(summaryData))
names(summaryData) <- gsub("angle","Angle",names(summaryData))
names(summaryData) <- gsub("BodyBody","Body",names(summaryData))
names(summaryData) <- gsub("gravity","Gravity",names(summaryData))
names(summaryData) <- gsub("Gyro","Gyroscope",names(summaryData))
names(summaryData) <- gsub("Mag","Magnitude",names(summaryData))
names(summaryData) <- gsub("tBody","TimeBody",names(summaryData))
names(summaryData) <- gsub("^t","Time",names(summaryData))
names(summaryData) <- gsub("^f","Frequency",names(summaryData))
names(summaryData) <- gsub("-mean()","Mean",names(summaryData))
names(summaryData) <- gsub("-std()","STD",names(summaryData))
names(summaryData) <- gsub("-freq()","Frequency",names(summaryData))

## Step 5: From data set in step 4, creates a second, independently tidy data 
##         set with average of each variable for each activity and each subject

# making subject a factor
summaryData$Subject <- as.factor(summaryData$Subject)

# Creating independent data set with mean of each variable for each activity and subject
tidyData <- summaryData %>%
            group_by(Subject, Activity) %>%
            summarise_all(funs(mean))

# Writing final tidy data set to a file

write.table(tidyData, file = "tidyData.txt", row.names = FALSE)

