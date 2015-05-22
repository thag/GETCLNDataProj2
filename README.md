### Introduction

This README file explains how the project scripts work.


### Project Script

* The only script required to create the tidy data is `run_analysis.R`

### CodeBook.md

The CodeBook.md file (part of this repo) explains the following

* Data source: Where the original raw data can be downloaded from
* Tidy data dictionary: Describes/Defines each variable

### Script Requirements
* To run the script you need default R and the libraries : `utils`, `plyr` and `dplyr`
* This script was tested in RStudio Version 0.98.1103 on May 22, 2015
* Make sure the libraries are installed and internet connection is ON
* Make sure the data is dowloaded from the website specified in the CodeBook.md and is unzipped and is available in the current working directory. The txt files should be under the folder named `UCI HAR Dataset`
* Run the script and it should open, create, and read files, and create and delete various temporary data frames. The final data frames that has the tidy data is called `result`


### Transformations : How the script works

Step-by-step explanation of `run_analysis.R`: Explains how each step transforms/merge/clean data from the raw file to tidy data

For each of the following step, the script opens a file, stores in a data frame, does the required manipulation, and finally deletes the temporary data frames.

1. `subject_test.txt` and `subject_train.txt` has the identifier of the subject who carried out the experiment on a test/train basis. There were 30 subjects who were observed multiple times for a total of 10299 test and train observations. These data sets were merged to have a single data set `subject_test_train` representing all the observations.

2. `X_test.txt` and `X_train.txt` has the 561-feature vector variables with time and frequency domain variables for each experimental observation. These files were merged to form 10299 observations with 561 variables and stored in data frame `x_test_train_labels`

3. `y_test.txt` and `y_train.txt` has activity identifier numbers for `X_test.txt` and `X_train.txt` correspondigly. Thus, they were merged to form 10299 observations with one variable representing the activity in data frame `y_test_train_labels`

4. The names for the 561 feature vectors are provided via `features.txt` file and was read into data frame `features`. This data frame was used to name the columns of the dataset created in step 2 `x_test_train_labels`.

5. `activity_labels.txt` has activity descriptions and its corresponding identifier. There were a total of 6 activities and was stored in data frame `activity_labels`. This was joined with dataset from step 3 `y_test_train_labels` to provide description to the activities carried out during observations. The dataset created at this step is called `y_test_train_activity_labels`. The variable names for activity id and activity description were added.

6. Data from step 5 `y_test_train_activity_labels` and step 4 `x_test_train_labels` were column binded to bind the activity and 561 feature vector for each activity. This new data `y_test_train_activity_labels_x_test_train` provides 561 features vectors for each activity observation (10299) performed.

7. dataset from step 1 `subject_test_train` and step 6 `y_test_train_activity_labels_x_test_train` were column binded to bind the subjects and feature vectors. This new data `subject_y_test_train_activity_labels_x_test_train` provides the 561 feature vector for the subjects for every observation (10299). This data finally links the subjects, activities, and their corresponding 561 feature vectors.

8. In this step, the data corresponding to variables from `subject_y_test_train_activity_labels_x_test_train` created in step 7, which have "mean" or "std" as part of their name have been extracted, in addition to the subject id, activity id, and activity description. It is stored in `stripped_subject_y_test_train_activity_labels_x_test_train`

9. In this step, the data from step 8 `stripped_subject_y_test_train_activity_labels_x_test_train` is summarized on subject id and activity id, to get the average for each feature vector for each subject and activity. The output is stored in data frame `result`. It has 180 observations and 89 variables. The variable names corresponding to each averaged feature vector is prefixed with `AverageOf.` to denote that the original variables have been grouped and mean was calculated. The first three variables were renamed using `.` as the separator to be consistent.

10. In the final step, the data from step 9 is written to a file and read back for verification.