######################################################################
## Coursera   : Getting and Cleaning Data
## Date       : July 2014
## Project    : 2
## Due        : 27/JUL/2014
## Inputs     : (1) features.txt'       : List of all features.
##              (2) activity_labels.txt': Links the class labels with their activity name.
##              (3) Training Data  (70% of data)
##                  (a) X_train.txt': Training set.
##                  (b) y_train.txt': Training labels.
##                  (c) subject_train:
##              (4) Test Data  (30% of data)
##                  (a) X_test.txt': Test set.
##                  (b) y_test.txt': Test labels.
##                  (c) subject_test.txt 
## Outputs    : (1) tidyDataFile.csv
## Pre-Req    : (1) Files have been downloaded, unzipped
##              (2) Working directory set
##              (3) All input files exist in working directory
##
## Procssing Overview
## ==================
##   (10)  Read activity and feature files
##   (15)  Restrict "feature" names to std and mean
##   (20)  Read and massage training data, 
##         Join observations (X) to subject and activity
##         Restrict to std/mean measures
##   (25)  Read and massage test data.
##         Join observations (X) to subject and activity
##         Restrict to std/mean measures
##   (30)  Merge training and test sets 
##   (40)  Calculate average each measurement by subject and activity.
##   (50)  Add activity name using activity id
##   (60)  Rename the "std|mean" columns to something more meaningful.
##   (70)  Reorder columns so that activy_name follows activity_id.
##   (80)  Write tidy dataframe to csv
######################################################################

#===================================================================
#  (10) Read Labels
#       - Activity Labels
#       - Feature Labels
#       - For each file
#         - No headers
#         - Default separtor used (i.e. spaces)
#         - Set column names
#===================================================================
activities <- read.table( 'activity_labels.txt', 
                 header = FALSE)
names(activities) <- c('activity_id', 'activity_name')

features <- read.table('features.txt', 
                 header = FALSE)
names(features) <- c('feature_id', 'feature_name')

#===================================================================
#  (15) Create list of features related to std or mean
#       - grep for feature names with mean or std in them
#       - meanFreqFeatures_T_F: Logical vector (i.e. TRUE or FALSE)
#       - meanFreqFeatures    : Reduce list of features. Only
#                               has std or mean features
#       - meanFreqColumns     : Changed from factor to character
#      Assert : This block produces a list of 86 column names.
#===================================================================
meanFreqFeatures_T_F <-  grepl('mean|std', features$feature_name, ignore.case=TRUE)
meanFreqFeatures     <- features[meanFreqFeatures_T_F, ]
meanFreqColumns      <- as.character(meanFreqFeatures$feature_name)

#===================================================================
#  (20) Prepare Training Data
#       Read the training data, assign names, reduce to mean|std
#       columns and merge with subject and activity.
#       (a) X_train : 561 columns which aligns with 561 features
#                     7352 rows
#       (b) Reduce the number of columns in X_Train.  The 
#           result "meanFreq_X_train" only has mean or std cols.
#       (c) Read activity file : y_train : 1 column for the activity id
#                  7352 rows
#       (d) Read subject file  : 1 column for subject id
#                  7352 rows
#       (e) Each input file has 7352 rows.  To add the activity
#           and subject to the observations simply cbind
#  Assert : This block of code produces the training data (7352 rows).
#           along with the activity and subject. The measurements
#           are all std or mean.  There will be 88 columns
#===================================================================
X_train <- read.table( 'X_train.txt' ,        # Read Observations
                      header = FALSE)
names(X_train) <- features$feature_name       # Assign col names

meanFreq_X_train <- X_train[meanFreqColumns]  # Reduce columns


activity_train <- read.table('y_train.txt',   # Activity list
                      header = FALSE)
names(activity_train) <- c('activity_id')     # Assign name

subject_train <- read.table('subject_train.txt',
                            header = FALSE)
names(subject_train) <- c('subject_id')       # Assign name

meanFreq_X_train <- cbind(subject_train , activity_train , meanFreq_X_train)

#===================================================================
#  (25) Prepare Test Data (Similar to Training Data)
#       Read the test data, assign names, reduce to mean|std
#       columns and merge with subject and activity.
#       (a) X_test : 561 columns which aligns with 561 features
#                     2947 rows
#       (b) Reduce the number of columns in X_Train.  The 
#           result "meanFreq_X_train" only has mean or std cols.
#       (c) Read activity file : y_train : 1 column for the activity id
#                  2947 rows
#       (d) Read subject file  : 1 column for subject id
#                  2947 rows
#       (e) Each input file has 2947 rows.  To add the activity
#           and subject to the observations simply cbind
#  Assert : This block of code produces the test data (2947 rows).
#           along with the activity and subject. The measurements
#           are all std or mean.  There will be 88 columns
#===================================================================
X_test <- read.table( 'X_test.txt' ,          # Read Observations
                       header = FALSE)
names(X_test) <- features$feature_name       # Assign col names

meanFreq_X_test <- X_test[meanFreqColumns]   # Reduce columns


activity_test <- read.table('y_test.txt',    # Activity list
                             header = FALSE)
names(activity_test) <- c('activity_id')     # Assign name

subject_test <- read.table('subject_test.txt',
                            header = FALSE)
names(subject_test) <- c('subject_id')       # Assign name

meanFreq_X_test <- cbind(subject_test , activity_test , meanFreq_X_test)

#===================================================================
#  (30) Merge training and test sets for
#      (a) In:  meanFreq_X_train : 7352  rows and 88 columns
#               meanFreq_X_test  : 2947  rows and 88 columsn
#      (b) Out: meanFreq_X_merge : 10299 rows and 88 columns
#===================================================================
meanFreq_X_merge     <- rbind(meanFreq_X_train, meanFreq_X_test)

#===================================================================
#  (40) Calculate average for each measurement by subject and 
#       activity
#       (a) aggregate col3 to end. (i.e. measurements)
#           by suject and activity
#       (b) Rename the default group1 and group2 columns to
#           subject_id and activity_id
#===================================================================
avg_By_Subj_Acty <- aggregate(meanFreq_X_merge[3 : ncol(meanFreq_X_merge)], 
                    by=list(meanFreq_X_merge$subject_id,
                            meanFreq_X_merge$activity_id),
                    FUN=mean, na.rm=TRUE)
names(avg_By_Subj_Acty)[1:2] <- c('subject_id', 'activity_id')


#===================================================================
#  (50) The dataframe "avg_By_Subj_Acty" only has activity_id.
#       Add a column with the activity name.
#===================================================================

m <- match(avg_By_Subj_Acty$activity_id, activities$activity_id)
avg_By_Subj_Acty$activity_name <- activities[m,2]
class(avg_By_Subj_Acty)
#m

colnames(avg_By_Subj_Acty)

#===================================================================
#  (60) Rename the "std|mean" columns to something more meaningful.
#       Also, make them R friendly.
#===================================================================

names(avg_By_Subj_Acty) <- sub("^t", "time", names(avg_By_Subj_Acty) )

names(avg_By_Subj_Acty) <- sub("^f", "freq", names(avg_By_Subj_Acty) )
names(avg_By_Subj_Acty) <- sub("-std", "Std", names(avg_By_Subj_Acty) )
names(avg_By_Subj_Acty) <- sub("-mean", "Mean", names(avg_By_Subj_Acty) )

names(avg_By_Subj_Acty) <- sub("\\(t", "Time", names(avg_By_Subj_Acty) )

names(avg_By_Subj_Acty) <- gsub('\\(', '', names(avg_By_Subj_Acty) )
names(avg_By_Subj_Acty) <- gsub(")", "", names(avg_By_Subj_Acty) )
names(avg_By_Subj_Acty) <- gsub(",", "_", names(avg_By_Subj_Acty) )
names(avg_By_Subj_Acty) <- gsub("-", "_", names(avg_By_Subj_Acty) )

names(avg_By_Subj_Acty) <- sub("gravity", "Gravity", names(avg_By_Subj_Acty) )


#===================================================================
#  (70) Reorder columns so that activy_name follows activity_id.
#       (a) There are 89 columns.
#       (b) activity_name is column 89
#       (c) columns [3:88] are measures
#       (d) move column 89 to 3rd 
#  Assert : The tidy data frame has been created.
#===================================================================
colList <- colnames(avg_By_Subj_Acty)
tidyDF<-subset(avg_By_Subj_Acty,select=c(colList[1:2],colList[89],colList[3:88])) 

#===================================================================
#  (80) Write tidy dataframe to csv
#===================================================================
write.csv(tidyDF, "tidyDataFile.csv", row.names=FALSE)

#=========End of Program=============================================

