### Introduction

This README file explains how the project scripts work.


### Project Script

* The only script required to create the tidy data is `run_analysis.R`
* To run the script you need default R and the libraries : `utils`, `plyr` and `dplyr`
* This script was tested in RStudio Version 0.98.1103 on May 22, 2015
* Make sure the libraries are installed and internet connection is ON
* Make sure the data is dowloaded from the website specified in the CodeBook.md and is unzipped and is available in the current working directory. The txt files should be under the folder named "UCI HAR Dataset"
* Run the script and it should open, create, and read files, and create and delete various temporary data frames. The final data frames that has the tidy data is called "result"

### CodeBook.md
The CodeBook.md file explains the following

* Data source: Where the original raw data can be downloaded from
* Tidy data dictionary: Describes/Defines each variable

### Transformations : How the script works

Step-by-step explanation of `run_analysis.R`: Explains how each step transforms/merge/clean data from the raw file to tidy data

1. subject_test.txt and subject_train.txt had the identifier of the subject who carried out the experiment on a test/train basis. There are 30 subjects who were observed multiple times for a total of 10299 test and train observations. These data sets were merged to have a single data set representing all the observations.

2. X_test.txt and X_train.txt had 561-feature vector variables with time and frequency domain variables for each experimental observation. These files were merged to form 10299 observations with 561 variables.

3. y_test.txt and y_train.txt had activity identifier number for X_test.txt and X_train.txt correspondigly. Thus, they were merged to form 10299 observations with one variable representing the activity.

4. The names for the 561 feature vectors are provided via features.txt file. This data set was used to name the columns of the dataset created in step 2.

5. activity_labels.txt had activity description and its corresponding identifier. There were a total of 6 activities. This was joined with dataset from step 3 to provide description to the activities carried out during observations. The dataset created at this step is called y_test_train_activity_labels. The variable names for activity id and activity description were added.

6. Data from steps 4 and 5 were column binded to bind the activity and 561 feature vector for each activity. This new data y_test_train_activity_labels_x_test_train provides 561 features vectors for each activity observation (10299) performed.

7. dataset from steps 1 and 6 were column binded to bind the subjects and feature vectors. This new data subject_y_test_train_activity_labels_x_test_train provides the 561 feature vector for the subjects for every observation (10299). This data finally links the subjects, activities, and their corresponding 561 feature vectors.

8. In this step, the data corresponding to variables that have "mean" or "std" as part of their name have been extracted in addition to the subject id, activity id, and activity description. It is stored in stripped_subject_y_test_train_activity_labels_x_test_train

9. In this step, the data from step 8 is summarized on subject id and activity id, to get the average for each feature vector for each subject and activity. The output is stored in "result" data frame. It has 180 observations and 89 variables. The variable names corresponding to each averaged feature vector is prefixed with "Average.Of" to denote that the original variables have been grouped and mean was calculated. The first three variables were renamed using "." as the separator to be consistent.

10. In the final step, the data from step 9 is written to a file and read back for verification.