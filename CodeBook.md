---
title: "CodeBook"
author: "Sydney Yount"
date: "1/10/2022"
output: html_document
---

---
title: "CodeBook"
author: "Sydney Yount"
date: "1/10/2022"
output: html_document
---

1. Download data set
- Download dataset from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
- Unzip files into folder called UCI HAR Dataset

2. Format training and test data sets
- features: features.txt (561 observations with 2 variables)
- activities: activity_labels.txt (6 observations with 2 variables)
- subject_test: test/subject_test.txt (2947 observations with 1 variable)
- subject_train: test/subject_train.txt (7352 observations with 1 variable)
- x_test: test/x_test.txt (2947 observations with 561 variables)
- x_train: test/x_train.txt (7352 observations with 561 variables)
- y_test: test/y_test.txt (2947 observations with 1 variables)
- y_train: test/y_train.txt (7352 observations with 1 variable)

3. Merging test and training data
- XDat <- x train and test data merged (10299 oberservations with 561 variables)
- YDat <- y train and test data merged (10299 oberservations with 1 variable)
- SubjectDat <- subject train and test data merged (10299 oberservations with 1 variable)
- MergedData <- XDat,YDat and SubjectDat merged together into one large dataset (10299 oberservations with 563 variables)

4. Extracting mean and standard deviation
-summaryData: Selecting only data including mean and standard deviation. Includes subject and code to identify measurements (10299 oberservations with 88 variables)

5. Replacing code with descriptive activity name
- Replaces code number with activity description given in activities variable

6. Changing labels in data set
- Replaces all abbreviations or repeated words in data set with full word (ex. Acc changes to Accelerometer)

7. Creaing final tidy data set
- tidyData (180 observations with 88 variables) summarizes the data within the summaryData by taking the average (mean) of each measurement by activity description and subject number,this data is exported into a text file names "tidayData.txt"
