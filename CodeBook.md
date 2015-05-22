## Code Book

### Introduction

This Code Book is for Getting and Cleaning Data, Course Project 2 due on May 24, 2015. This code book describes the data and variables (attributes).

### Data Source

Research description of the main project is available at [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Data for this project was obtained from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Tidy Data Created from run_analysis.R script

The original data from the data source was processed (read, merge, transform) by run_analysis.R script to create the final tidy data set. The below data dictionary describes the variables of the tidy data, and the transformation section (in the README.md file) describes how the raw data was made tidy using R.

### Data Dictionary

All the variables are defined below

    subject.ID      1   
        Subject Identification Number   
                    1..30 .Unique Identifier assigned by the researchers   
                    
    activity.ID     1
        ID of the activity performed by the subject
                    1  .WALKING
                    2  .WALKING_UPSTAIRS
                    3  .WALKING_DOWNSTAIRS
                    4  .SITTING
                    5  .STANDING
                    6  .LAYING
                    
    activity.Desc   6..18
        Description of the activity performed by the subject
                    WALKING
                    WALKING_UPSTAIRS
                    WALKING_DOWNSTAIRS
                    SITTING
                    STANDING
                    LAYING
    
    AverageOf.tBodyAcc.mean...X
    AverageOf.tBodyAcc.mean...Y                   
    AverageOf.tBodyAcc.mean...Z                   
    AverageOf.tBodyAcc.std...X                     
    AverageOf.tBodyAcc.std...Y                    
    AverageOf.tBodyAcc.std...Z                     
    AverageOf.tGravityAcc.mean...X                
    AverageOf.tGravityAcc.mean...Y                 
    AverageOf.tGravityAcc.mean...Z                
    AverageOf.tGravityAcc.std...X                  
    AverageOf.tGravityAcc.std...Y                 
    AverageOf.tGravityAcc.std...Z                  
    AverageOf.tBodyAccJerk.mean...X               
    AverageOf.tBodyAccJerk.mean...Y                
    AverageOf.tBodyAccJerk.mean...Z               
    AverageOf.tBodyAccJerk.std...X                 
    AverageOf.tBodyAccJerk.std...Y                
    AverageOf.tBodyAccJerk.std...Z                 
    AverageOf.tBodyGyro.mean...X                  
    AverageOf.tBodyGyro.mean...Y                   
    AverageOf.tBodyGyro.mean...Z                  
    AverageOf.tBodyGyro.std...X                    
    AverageOf.tBodyGyro.std...Y                   
    AverageOf.tBodyGyro.std...Z                    
    AverageOf.tBodyGyroJerk.mean...X              
    AverageOf.tBodyGyroJerk.mean...Y               
    AverageOf.tBodyGyroJerk.mean...Z              
    AverageOf.tBodyGyroJerk.std...X                
    AverageOf.tBodyGyroJerk.std...Y               
    AverageOf.tBodyGyroJerk.std...Z                
    AverageOf.tBodyAccMag.mean..                  
    AverageOf.tBodyAccMag.std..                    
    AverageOf.tGravityAccMag.mean..               
    AverageOf.tGravityAccMag.std..                 
    AverageOf.tBodyAccJerkMag.mean..              
    AverageOf.tBodyAccJerkMag.std..                
    AverageOf.tBodyGyroMag.mean..                 
    AverageOf.tBodyGyroMag.std..               
    AverageOf.tBodyGyroJerkMag.mean..             
    AverageOf.tBodyGyroJerkMag.std..               
    AverageOf.fBodyAcc.mean...X                   
    AverageOf.fBodyAcc.mean...Y                    
    AverageOf.fBodyAcc.mean...Z                   
    AverageOf.fBodyAcc.std...X                     
    AverageOf.fBodyAcc.std...Y                    
    AverageOf.fBodyAcc.std...Z                     
    AverageOf.fBodyAcc.meanFreq...X               
    AverageOf.fBodyAcc.meanFreq...Y                
    AverageOf.fBodyAcc.meanFreq...Z               
    AverageOf.fBodyAccJerk.mean...X                
    AverageOf.fBodyAccJerk.mean...Y               
    AverageOf.fBodyAccJerk.mean...Z                
    AverageOf.fBodyAccJerk.std...X                
    AverageOf.fBodyAccJerk.std...Y                 
    AverageOf.fBodyAccJerk.std...Z                
    AverageOf.fBodyAccJerk.meanFreq...X            
    AverageOf.fBodyAccJerk.meanFreq...Y           
    AverageOf.fBodyAccJerk.meanFreq...Z            
    AverageOf.fBodyGyro.mean...X                  
    AverageOf.fBodyGyro.mean...Y                   
    AverageOf.fBodyGyro.mean...Z                  
    AverageOf.fBodyGyro.std...X                    
    AverageOf.fBodyGyro.std...Y                   
    AverageOf.fBodyGyro.std...Z                    
    AverageOf.fBodyGyro.meanFreq...X              
    AverageOf.fBodyGyro.meanFreq...Y               
    AverageOf.fBodyGyro.meanFreq...Z              
    AverageOf.fBodyAccMag.mean..                   
    AverageOf.fBodyAccMag.std..                   
    AverageOf.fBodyAccMag.meanFreq..               
    AverageOf.fBodyBodyAccJerkMag.mean..          
    AverageOf.fBodyBodyAccJerkMag.std..            
    AverageOf.fBodyBodyAccJerkMag.meanFreq..      
    AverageOf.fBodyBodyGyroMag.mean..              
    AverageOf.fBodyBodyGyroMag.std..              
    AverageOf.fBodyBodyGyroMag.meanFreq..          
    AverageOf.fBodyBodyGyroJerkMag.mean..         
    AverageOf.fBodyBodyGyroJerkMag.std..           
    AverageOf.fBodyBodyGyroJerkMag.meanFreq..     
    AverageOf.angle.tBodyAccMean.gravity.          
    AverageOf.angle.tBodyAccJerkMean..gravityMean.
    AverageOf.angle.tBodyGyroMean.gravityMean.     
    AverageOf.angle.tBodyGyroJerkMean.gravityMean.
    AverageOf.angle.X.gravityMean.                 
    AverageOf.angle.Y.gravityMean.                
    AverageOf.angle.Z.gravityMean.
        All the above variables that are prefixed with "AverageOf." represents the average of all the feature vectors that had mean or std as part of their name from the X_train.txt, X_test.txt, and features.txt files from the data source. There are totally 86 variables. Each value of the variable is numeric and represents the average value of a feature vector over a single subject and activity. Each feature vector is explained in the "features_info.txt" file. Only change from the original feature vector names and the above variable names is the `(`, `)` and `-` have been replaced by `.` as `write.table` converts these characters to `.`

### Conclusion

The CodeBook.md provides all the data description for the assignment.