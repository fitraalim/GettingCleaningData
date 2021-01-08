# Getting and Cleaning Data Course Project

## Purpose
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.

## Goal
The goal is to prepare tidy data that can be used for later analysis.

## Data Source
Data used for this project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Data contains the experiments result of each person performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing
Samsung Galaxy S II on the waist capturing 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

Please refer to http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for detailed descriptions.

## read_analysis.R
This script does:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Dependencies
The read_analysis.R uses 2 packages: dplyr and tictoc. To install:

`install.packages('dplyr')`

`install.packages('tictoc')`

## Performance
On my 2.7GHz Quad-Core Intel Core i5 computer, file reads execution time is around 14s while file writes execution time is around 0.02s