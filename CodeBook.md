CodeBook for the Tidy Dataset
=============================
This code book provides the necessary details to understand how the _Tidy Dataset_ was created, why it was created and how to interpret the data in file.

Study Design
============
The goal of this exercise was to prepare a **tidy data set** from the observations of an earlier study.  The _tidy data set_ will facilitate later analysis.  This exercise was done as part of course requirements for the Coursera Course *Getting and Cleaning Data*.  The preparation of the _tidy data set_ was done using *R*.  A description of the R code and process for running the script can be found in the **README.md** file associated with this repository.

Source Data Background
-----------------------

### Nature of Source Data
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to below represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  

### Location of Source Data
The source data can be found at:-

* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Source Data Files

When the source file is unzipped, the following file structure is created:-

<ul>
<li> UCI HAR Dataset
<ul>
<li>test
<ul>
<li>Inertial Signals
<ul>
<li>body_acc_x_test.txt  <
<li>body_acc_y_test.txt  
<li>body_acc_z_test.txt  
<li>body_gyro_x_test.txt  
<li>body_gyro_y_test.txt  
<li>body_gyro_z_test.txt  
<li>total_acc_x_test.txt
<li>total_acc_y_test.txt
<li>total_acc_z_test.txt
</ul>
<li>subject_test.txt
<li>X_test.txt
<li>y_test.txt
</ul>
<li>train
<ul>
<li>Inertial Signals
<ul>
<li>body_acc_x_train.txt  <
<li>body_acc_y_train.txt  
<li>body_acc_z_train.txt  
<li>body_gyro_x_train.txt  
<li>body_gyro_y_train.txt  
<li>body_gyro_z_train.txt  
<li>total_acc_x_train.txt
<li>total_acc_y_train.txt
<li>total_acc_z_train.txt
</ul>
<li>subject_train.txt
<li>X_train.txt
<li>y_train.txt
</ul>
<li>activity_labels.txt
<li>features.txt
<li>features_info.txt
<li>README.txt
</ul>
</ul>

### Overview of the Source Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### File Descriptions
The _test_ and _train_ directories are similar in structure.  They differ in file names so the description of ht relationship between the files is the same for both.

#### Activity Labels
The *activity_lablels.txt* file has two _unnamed_ columns.  The first is an *id* and the second is a *name*.  The *id* can be associated with the single column in the files *y_train.txt* and *y_test.txt*.

#### Feature Labels
The *features.txt* file has the labels (i.e. column headings) for each of the 561 measurements (i.e. columns) in the *X_train.txt* and *X_test.txt* files.  As mentioned above, a description of the features can be found in *features_info.txt*.

#### Subjects 
The _annonymous_ subjects are only identified by an *id*.  The subjects are listed in the files *subject_train.txt* and *subject_test.txt*.

#### Measurements
The 561 different types of measurement are the columns in the files *X_train.txt* and *X_test.txt*.  Each row in the files represents a _subject_ doing an _activity_.

#### Inertia Files
The files in the _Inertia Signals_ directories are not relevant to this exercise.

### Data Relationships (Identifying Subject and Activity for a Measurement)
Some ponts to note about the files are:-

<ul>
<li>The 561 columns in the **X** files (e.g. X_test.txt) can be named using the 561 names (in order) from features.txt.
<li>The rows of subject files (e.g. *subject_train.txt*) can be concatenated with the rows of the matching X file (e.g *X_train.txt*) in the same order. This will identify the subject related to that row.
<li>The rows of activity files (e.g. *y_train.txt*) can be concatenated with the rows of the matching X file (e.g *X_train.txt*) in the same order. This will identify the activity related to that row.
<li>The process for identifying the subject and activity is the same for both the test and training sets of data.
</ul>

Tidy Dataset Requirements
=========================
The process of _tidying_ up the source data involved:-

<ul>
<li>Merge the training and the test sets to create one data set.
<li>Extract only the measurements on the mean and standard deviation for each measurement. 
<li>Use descriptive activity names to name the activities in the data set
<li>Appropriately labels the data set with descriptive variable names. 
<li>Creates an independent tidy data set with the average of each variable for each activity and each subject. 
</ul>

Code Book
=========

Interpretaton of Requirements
-----------------------------

### Standard and Mean Attributes
Any _feature_ column with a name that contains **std** or **mean** (case insensitive) is assumed to meet the criteria.

### Activity Labels
This requirement simoly requires an additional column on each row that translates the _activity id_ into a meaningful description such as _WALKING_.

### Descriptive Variable Names
Many of the feature names as provided contain characters which are not _R-friendly_ such as brackets.  As well, it is useful to expand some of the names to be more descriptive, such as replacing leading _t_ by _time_.

### Tidy Data Set
The tidy data produced is a comma separated text file **tidyDataFile.csv**. It will be created in the working directory of the R script.

Description of Features in Original Dataset
-------------------------------------------
Refer to the **README.txt** and **features_info.txt** in the sourced files.  

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

<ul>
<li>tBodyAcc-XYZ
<li>tGravityAcc-XYZ
<li>tBodyAccJerk-XYZ
<li>tBodyGyro-XYZ
<li>tBodyGyroJerk-XYZ
<li>tBodyAccMag
<li>tGravityAccMag
<li>tBodyAccJerkMag
<li>tBodyGyroMag
<li>tBodyGyroJerkMag
<li>fBodyAcc-XYZ
<li>fBodyAccJerk-XYZ
<li>fBodyGyro-XYZ
<li>fBodyAccMag
<li>fBodyAccJerkMag
<li>fBodyGyroMag
<li>fBodyGyroJerkMag
</ul>

The set of variables that were estimated from these signals are: 

<uL>
<li>mean(): Mean value
<li>std(): Standard deviation
<li>mad(): Median absolute deviation 
<li>max(): Largest value in array
<li>min(): Smallest value in array
<li>sma(): Signal magnitude area
<li>energy(): Energy measure. Sum of the squares divided by the number of values. 
<li>iqr(): Interquartile range 
<li>entropy(): Signal entropy
<li>arCoeff(): Autorregresion coefficients with Burg order equal to 4
<li>correlation(): correlation coefficient between two signals
<li>maxInds(): index of the frequency component with largest magnitude
<li>meanFreq(): Weighted average of the frequency components to obtain a mean frequency
<li>skewness(): skewness of the frequency domain signal 
<li>kurtosis(): kurtosis of the frequency domain signal 
<li>bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
<li>angle(): Angle between to vectors.
</ul>

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

<ul>
<li>gravityMean
<li>tBodyAccMean
<li>tBodyAccJerkMean
<li>tBodyGyroMean
<li>tBodyGyroJerkMean
</ul>

The complete list of variables of each feature vector is available in 'features.txt',

Note that:-
<ul>
<li>Features are normalized and bounded within [-1,1].
<li>Each feature vector is a row on the text file.
</ul>


Standard Deviation and Mean Attributes Selected
-----------------------------------------------
The following attributes were selected:-
<ol>
<li>"tBodyAcc-mean()-X"                   
<li>"tBodyAcc-mean()-Y"                    
<li>"tBodyAcc-mean()-Z"                    
<li>"tBodyAcc-std()-X"
<li>"tBodyAcc-std()-Y"                    
<li>"tBodyAcc-std()-Z"                     
<li>"tGravityAcc-mean()-X"                
<li>"tGravityAcc-mean()-Y"               
<li>"tGravityAcc-mean()-Z"                 
<li>"tGravityAcc-std()-X"                 
<li>"tGravityAcc-std()-Y"                 
<li>"tGravityAcc-std()-Z"                  
<li>"tBodyAccJerk-mean()-X"               
<li>"tBodyAccJerk-mean()-Y"               
<li>"tBodyAccJerk-mean()-Z"                
<li>"tBodyAccJerk-std()-X"                
<li>"tBodyAccJerk-std()-Y"                
<li>"tBodyAccJerk-std()-Z"                 
<li>"tBodyGyro-mean()-X"                  
<li>"tBodyGyro-mean()-Y"                   
<li>"tBodyGyro-mean()-Z"                 
<li>"tBodyGyro-std()-X"                   
<li>"tBodyGyro-std()-Y"                  
<li>"tBodyGyro-std()-Z"                   
<li>"tBodyGyroJerk-mean()-X"              
<li>"tBodyGyroJerk-mean()-Y"              
<li>"tBodyGyroJerk-mean()-Z"              
<li>"tBodyGyroJerk-std()-X"               
<li>"tBodyGyroJerk-std()-Y"               
<li>"tBodyGyroJerk-std()-Z"               
<li>"tBodyAccMag-mean()"                  
<li>"tBodyAccMag-std()"                   
<li>"tGravityAccMag-mean()"               
<li>"tGravityAccMag-std()"                
<li>"tBodyAccJerkMag-mean()"              
<li>"tBodyAccJerkMag-std()"               
<li>"tBodyGyroMag-mean()"                 
<li>"tBodyGyroMag-std()"                  
<li>"tBodyGyroJerkMag-mean()"             
<li>"tBodyGyroJerkMag-std()"              
<li>"fBodyAcc-mean()-X"                   
<li>"fBodyAcc-mean()-Y"                   
<li>"fBodyAcc-mean()-Z"                   
<li>"fBodyAcc-std()-X"                     
<li>"fBodyAcc-std()-Y"                   
<li>"fBodyAcc-std()-Z"                    
<li>"fBodyAcc-meanFreq()-X"               
<li>"fBodyAcc-meanFreq()-Y"               
<li>"fBodyAcc-meanFreq()-Z"               
<li>"fBodyAccJerk-mean()-X"                
<li>"fBodyAccJerk-mean()-Y"              
<li>"fBodyAccJerk-mean()-Z"               
<li>"fBodyAccJerk-std()-X"                 
<li>"fBodyAccJerk-std()-Y"               
<li>"fBodyAccJerk-std()-Z"                
<li>"fBodyAccJerk-meanFreq()-X"            
<li>"fBodyAccJerk-meanFreq()-Y"         
<li>"fBodyAccJerk-meanFreq()-Z"           
<li>"fBodyGyro-mean()-X"                   
<li>"fBodyGyro-mean()-Y"                 
<li>"fBodyGyro-mean()-Z"                  
<li>"fBodyGyro-std()-X"                    
<li>"fBodyGyro-std()-Y"                   
<li>"fBodyGyro-std()-Z"                   
<li>"fBodyGyro-meanFreq()-X"               
<li>"fBodyGyro-meanFreq()-Y"              
<li>"fBodyGyro-meanFreq()-Z"              
<li> "fBodyAccMag-mean()"                   
<li>"fBodyAccMag-std()"                   
<li>"fBodyAccMag-meanFreq()"              
<li>"fBodyBodyAccJerkMag-mean()"           
<li>"fBodyBodyAccJerkMag-std()"           
<li>"fBodyBodyAccJerkMag-meanFreq()"      
<li>"fBodyBodyGyroMag-mean()"        
<li>"fBodyBodyGyroMag-std()"              
<li>"fBodyBodyGyroMag-meanFreq()"         
<li>"fBodyBodyGyroJerkMag-mean()"     
<li>"fBodyBodyGyroJerkMag-std()"         
<li>"fBodyBodyGyroJerkMag-meanFreq()"     
<li>"angle(tBodyAccMean,gravity)"         
<li>"angle(tBodyAccJerkMean),gravityMean)" 
<li>"angle(tBodyGyroMean,gravityMean)"    
<li>"angle(tBodyGyroJerkMean,gravityMean)" 
<li>"angle(X,gravityMean)"                 
<li>"angle(Y,gravityMean)"                
<li>"angle(Z,gravityMean)"                               
</ol>

Standard Deviation and Mean Attributes Renamed
-----------------------------------------------
The following features match by _sequence number_ to the orignal names.
<ol>
<li>"timeBodyAccMean_X"                  
<li> "timeBodyAccMean_Y"                     
<li>"timeBodyAccMean_Z"                    
<li>"timeBodyAccStd_X"                    
<li>"timeBodyAccStd_Y"                      
<li>"timeBodyAccStd_Z"                     
<li>"timeGravityAccMean_X"                
<li>"timeGravityAccMean_Y"                  
<li>"timeGravityAccMean_Z"                 
<li>"timeGravityAccStd_X"                 
<li>"timeGravityAccStd_Y"                  
<li>"timeGravityAccStd_Z"                  
<li>"timeBodyAccJerkMean_X"               
<li>"timeBodyAccJerkMean_Y"                
<li>"timeBodyAccJerkMean_Z"                
<li>"timeBodyAccJerkStd_X"                
<li>"timeBodyAccJerkStd_Y"                  
<li>"timeBodyAccJerkStd_Z"                 
<li>"timeBodyGyroMean_X"                  
<li>"timeBodyGyroMean_Y"                    
<li>"timeBodyGyroMean_Z"                   
<li>"timeBodyGyroStd_X"                   
<li>"timeBodyGyroStd_Y"                    
<li>"timeBodyGyroStd_Z"                    
<li>"timeBodyGyroJerkMean_X"             
<li>"timeBodyGyroJerkMean_Y"                
<li>"timeBodyGyroJerkMean_Z"               
<li>"timeBodyGyroJerkStd_X"              
<li>"timeBodyGyroJerkStd_Y"                 
<li>"timeBodyGyroJerkStd_Z"                
<li>"timeBodyAccMagMean"                 
<li>"timeBodyAccMagStd"                     
<li>"timeGravityAccMagMean"                
<li>"timeGravityAccMagStd"               
<li>"timeBodyAccJerkMagMean"                
<li>"timeBodyAccJerkMagStd"                
<li>"timeBodyGyroMagMean"                
<li>"timeBodyGyroMagStd"                    
<li>"timeBodyGyroJerkMagMean"              
<li>"timeBodyGyroJerkMagStd"            
<li>"freqBodyAccMean_X"                    
<li>"freqBodyAccMean_Y"                    
<li>"freqBodyAccMean_Z"                  
<li>"freqBodyAccStd_X"                      
<li>"freqBodyAccStd_Y"                     
<li>"freqBodyAccStd_Z"                    
<li> "freqBodyAccMeanFreq_X"                
<li>"freqBodyAccMeanFreq_Y"                
<li>"freqBodyAccMeanFreq_Z"              
<li>"freqBodyAccJerkMean_X"               
<li>"freqBodyAccJerkMean_Y"                
<li>"freqBodyAccJerkMean_Z"              
<li>"freqBodyAccJerkStd_X"  
<li>"freqBodyAccJerkStd_Y"                 
<li>"freqBodyAccJerkStd_Z"               
<li>"freqBodyAccJerkMeanFreq_X"             
<li>"freqBodyAccJerkMeanFreq_Y"            
<li>"freqBodyAccJerkMeanFreq_Z"          
<li>"freqBodyGyroMean_X"                    
<li>"freqBodyGyroMean_Y"                   
<li>"freqBodyGyroMean_Z"                 
<li>"freqBodyGyroStd_X"                    
<li>"freqBodyGyroStd_Y"                    
<li>"freqBodyGyroStd_Z"                   
<li> "freqBodyGyroMeanFreq_X"                
<li>"freqBodyGyroMeanFreq_Y"               
<li>"freqBodyGyroMeanFreq_Z"              
<li> "freqBodyAccMagMean"                   
<li>"freqBodyAccMagStd"                    
<li>"freqBodyAccMagMeanFreq"               
<li>"freqBodyBodyAccJerkMagMean"           
<li>"freqBodyBodyAccJerkMagStd"            
<li>"freqBodyBodyAccJerkMagMeanFreq"       
<li>"freqBodyBodyGyroMagMean"              
<li>"freqBodyBodyGyroMagStd"               
<li>"freqBodyBodyGyroMagMeanFreq"           
<li>"freqBodyBodyGyroJerkMagMean"          
<li>"freqBodyBodyGyroJerkMagStd"           
<li>"freqBodyBodyGyroJerkMagMeanFreq"       
<li>"angleTimeBodyAccMean_Gravity"         
<li> "angleTimeBodyAccJerkMean_GravityMean" 
<li>"angleTimeBodyGyroMean_GravityMean"     
<li>"angleTimeBodyGyroJerkMean_GravityMean"
<li>"angleX_GravityMean"                   
<li>"angleY_GravityMean"                    
<li>"angleZ_GravityMean"                   
</ol>

Other Attributes
----------------
In additon to the above 86 measurement attributes there ar 3 other attributes as follows:-

<ul>
<li>1.    subject_id    An integer [1:100] identifying the subject
<li>2.    activity_id   An integer [1:6] identifying the activity
<li>3.    activity_name A string describing the activity (e.g. WALKING)
<li>4-89  86 numeric measurements listed above
</ul>