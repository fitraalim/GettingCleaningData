# CodeBook
# Getting and Cleaning Data Course Project

## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Attribute Information
For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Please refer to http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for detailed descriptions.

Data used for this project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Variables
| Variables | Description |
| --------- | ----------- |
activitiesTest, subjectsTest, activitiesTrain, subjectsTrain, testData, trainData | Data from source
X_total, Y_total, Subjects_total | Merged datasets
features | Names for X_total dataset

## run_analysis.R
This script does raw data reading, merging, and extracting only mean and standard deviation for each measurement. Assuming that the data source is in place, the output
of this script is tidyData.txt containing average of each variable for each activity and each subject. This script depends on dplyr package, an fast, consistent tool for working with data frame like objects, both in memory and out of memory. Also, this script uses tictoc package to measure file reading time. To install these packages:

`install.packages('dplyr')`

`install.packages('tictoc')`

To run this script using command line:

`Rscript run_analysis.R`