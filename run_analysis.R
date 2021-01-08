## Programming Assignment 4: Getting and Cleaning Data Course Project
## The goal is to prepare tidy data that can be used for later analysis.

## Steps:
## 0. Get raw data.
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Loading dplyr
## dplyr is an fast, consistent tool for working with data frame like objects, both in memory and out of memory.
library('dplyr')

## Loading tictoc
## tictoc measures execution time (used while reading dataset and writing tidyData.txt)
library('tictoc')

#######################
## STEP 0: Get raw data
#######################
sourceUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
sourceFile <- "UCI HAR Dataset.zip"

if (!file.exists(sourceFile)) {
  download.file(sourceUrl, sourceFile, mode = "wb", cacheOK=FALSE)
}

# Unzip zip file
dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
  unzip(sourceFile)
}

# Set working directory to UCI Har Dataset
setwd("./UCI Har Dataset")

#######################################################################
## STEP 1: Merges the training and the test sets to create one data set
## File reading execution time will be displayed
#######################################################################

tic()

# Read features data
features <- read.table("features.txt")

# Read activity data
activityLabels <- read.table("activity_labels.txt")

# Read test data
activitiesTest <- read.table("test/y_test.txt")
subjectsTest <- read.table("test/subject_test.txt")
testData <- read.table("test/X_test.txt", fill=TRUE)

# Read training data
activitiesTrain <- read.table("train/y_train.txt")
subjectsTrain <- read.table("train/subject_train.txt")
trainData <- read.table("train/X_train.txt", fill=TRUE)

# Merging train and test data set into one
X_total <- rbind(trainData, testData)
Y_total <- rbind(activitiesTrain, activitiesTest)
Subjects_total <- rbind(subjectsTrain, subjectsTest)

toc()

#################################################################################################
## STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement
#################################################################################################

variable_names <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]
X_total <- X_total[,variable_names[,1]]

#################################################################################
## STEP 3: Uses descriptive activity names to name the activities in the data set
#################################################################################

colnames(Y_total) <- "activity"
Y_total$activityLabels <- factor(Y_total$activity, labels = as.character(activityLabels[,2]))
activityLabels <- Y_total[,-1]

############################################################################
## STEP 4: Appropriately labels the data set with descriptive variable names
############################################################################

colnames(X_total) <- features[variable_names[,1],2]

###################################################################################################################################################
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
###################################################################################################################################################

colnames(Subjects_total) <- "subject"
total <- cbind(X_total, activityLabels, Subjects_total)
total_mean <- total %>% group_by(activityLabels, subject) %>% summarize_each(list(mean))

# Write output to tidyData.txt
# File writing execution time will be displayed
tic()

write.table(total_mean, file = "../tidyData.txt", row.names = FALSE, col.names = TRUE)

toc()