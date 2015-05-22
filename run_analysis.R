# Getting and Cleaning Data : Project 2 : May 22, 2015

# Including Libraries -----------------------------------------------------
    library(utils)
    library(plyr)
    library(dplyr)

# Sec 0. Download and Unzip Files ------------------------------------------------
#     if(!file.exists("./data/3_cleaning_quiz3/")){dir.create("./data/3_cleaning_proj2/")}
#     url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#     download.file(url,destfile="./data/3_cleaning_proj2/UCIDataset.zip")
#     unzip("./data/3_cleaning_proj2/UCIDataset.zip", exdir = "./data/3_cleaning_proj2/.")


# Sec 1. Part 1. Merges the training and the test sets to create one data set. --------

    # Merging subject_test.txt and subject_train.txt ------------------------------------------------------
        subject_test <- read.table(file="UCI HAR Dataset/test/subject_test.txt")
        dim(subject_test)
        subject_train <- read.table(file="UCI HAR Dataset/train/subject_train.txt")
        dim(subject_train)
        subject_test_train <- rbind(subject_test, subject_train)
        dim(subject_test_train)
        rm(subject_test, subject_train) #remove the original DFs

    # X_test/train ------------------------------------------------------------
        x_test_labels   <- read.table(file="UCI HAR Dataset/test/X_test.txt")
        dim(x_test_labels)
        x_train_labels  <- read.table(file="UCI HAR Dataset/train/X_train.txt")
        dim(x_train_labels)
        x_test_train_labels <- rbind(x_test_labels, x_train_labels)
        dim(x_test_train_labels)
        rm(x_test_labels,x_train_labels)

    # Merging y_test.txt and y_train.txt ------------------------------------------------------------
        y_test_labels  <- read.table(file="UCI HAR Dataset/test/y_test.txt")
        dim(y_test_labels)
        y_train_labels  <- read.table(file="UCI HAR Dataset/train/y_train.txt")
        dim(y_train_labels)
        y_test_train_labels <- rbind(y_test_labels, y_train_labels)
        dim(y_test_train_labels)
        rm(y_test_labels, y_train_labels) #remove the original DFs

    # Read 561 vector names from features.txt ----------------------------------------------------------------
        features <- read.table(file="UCI HAR Dataset/features.txt")
        dim(features)


# Sec 4. Appropriately labels the data set with descriptive variable name --------


    # Give appropriate variable (column) names to X_test_train that has values for features.So use second column from features.txt ------------------------------------------------------
        names(x_test_train_labels) <- features$V2
        names(x_test_train_labels)
        rm(features)

# Sec 3. Uses descriptive activity names to name the activities in the da --------


    # Read activity names from activity_labels.txt ----------------------------------------------------------------
        activity_labels <- read.table(file="UCI HAR Dataset/activity_labels.txt")
        activity_labels
        dim(activity_labels)

    #join activity_label and y_test
        nrow(activity_labels)
        nrow(y_test_train_labels)
        
        #use join to maintain row order after joining the data frames (instead of merge which loses the order)
        y_test_train_activity_labels <- 
                join(y_test_train_labels, activity_labels, by = c("V1"), type="inner")
        
        names(y_test_train_activity_labels) <- c("activityID", "activityDesc") #rename the variables
        rm(activity_labels,y_test_train_labels)

# Sec 1. Part 2. Merges the training and the test sets to create one data set. --------

    #add all the colums from x_test_train to y_test_train_activity_labels
        y_test_train_activity_labels_x_test_train <- cbind(y_test_train_activity_labels, x_test_train_labels)
        dim(y_test_train_activity_labels_x_test_train)
        names(y_test_train_activity_labels_x_test_train)
        rm(y_test_train_activity_labels, x_test_train_labels)

    #set appropriate variable name to subject ids
        names(subject_test_train) <- "subjectID"

    #add all the columns from y_test_train_activity_labels_x_test_train to subject_test_train
        subject_y_test_train_activity_labels_x_test_train <- cbind(subject_test_train, y_test_train_activity_labels_x_test_train)
        names (subject_y_test_train_activity_labels_x_test_train)
        dim(subject_y_test_train_activity_labels_x_test_train)
        rm(subject_test_train, y_test_train_activity_labels_x_test_train)

# Sec 2. Extracts only the measurements on the mean and standard devia --------

        stripped_subject_y_test_train_activity_labels_x_test_train <- 
            subject_y_test_train_activity_labels_x_test_train[,grepl("subjectID|activity|mean|std",
                names(subject_y_test_train_activity_labels_x_test_train),ignore.case=TRUE, fixed=FALSE)]

        names(stripped_subject_y_test_train_activity_labels_x_test_train)
        dim(stripped_subject_y_test_train_activity_labels_x_test_train)
        rm(subject_y_test_train_activity_labels_x_test_train)

# Sec 5. From the data set in step 4, creates a second, independedent tidy data set with the average of each variable for each activity and each subject --------

        result <- stripped_subject_y_test_train_activity_labels_x_test_train %>% 
                    group_by(subjectID,activityID,activityDesc) %>% 
                        summarise_each(funs(mean))
        rm(stripped_subject_y_test_train_activity_labels_x_test_train)

        colnames(result) <- c("subject.ID","activity.ID","activity.Desc",paste("AverageOf",  
                                                            colnames(result[4:ncol(result)]), sep = "."))

        View(result)
        dim(result)

        #write tidy data to file
        write.table(result, file="GettingCleaningDataProject2.txt",row.name=FALSE)
        #Read Back and Test
        data <- read.table(file="GettingCleaningDataProject2.txt",header=TRUE)
        View(data)
        dim(data)
        rm(data)