Getting and Cleaning Data: Course Project
=========================================

Purpose
-------
The purpose of this *README.md* file is to provide the instructions for running the associated *R* script **run_analysis.R**.  The instructions assume the use of **RStudio** and that the reader knows how to use the RStudio interface.  

See the associated **CodeBook.md** associated with this README for further details on the files.

Environment
-----------
This instructions were developed on the following platform.  However, I believe that the instructions should also work on other platforms.

<ul>
<li> Operating System : Ubuntu 14.04 LTS
<li> RStudio          : 0.98.501 
<li> Memory           : 8Gb
</ul>

Input Data
----------
The source files must exist in the working directory before running this script.

### Obtaining Source Data
The source data can be found at:-

* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Storage Requirements
The downloaded file **getdata_projectfiles_UCI HAR Dataset.zip** is approximately 62Mb.  When this file is unzipped it produces 32 items requiring about 280Mb.

### Version
These instructions are based on the Human Activity Recognition Using Smartphones Dataset **Version 1.0**.

### Files Required (Must be in Working Directory)
The following files must exist in the working directory:-

<ol>
<li> features.txt'       : List of all features.
<li> activity_labels.txt : Links the class labels with their activity name.
<li>X_train.txt          : Training set (i.e measurements)
<li>y_train.txt          : Training labels (i.e. activities)
<li>subject_train        : Training subjects 
<li>X_test.txt'          : Test set.  (i.e measurements)
<li>y_test.txt'          : Test labels. (i.e. activities)
<li> subject_test.txt:    Test subjects
</ol>

Output Data
-----------
A single comma separated output file called **tidyDataFile.csv** is produced from this process.  The file is created in the working directory.  The size of the output file is about 290K.

Parameters
----------
There are no parameters to this script.


Processing Overview (run_analysis.R)
------------------------------------
The following high level steps are peformed by this script.  Each section of code in the script is labelled with a number such as **(10)**.

<ul>
<li>(10)  Read activity and feature files (working directory)
<li>(15)  Restrict "feature" names to std and mean
<li>(20)  Read and massage training data  (working directory)
<ul>
<li>      Join observations (X) to subject and activity
<li>      Restrict to std/mean measures
</ul>
<li>(25)  Read and massage test data  (working directory)
<ul>
<li>       Join observations (X) to subject and activity
<li>       Restrict to std/mean measures
</ul>
<li>(30)  Merge training and test sets 
<li>(40)  Calculate average of each measurement by subject and activity.
<li>(50)  Add activity name using activity id for lookup
<li>(60)  Rename the "std|mean" columns to more meaningful names and in the process make them R-friendly
<ul>
<li> leading "t" replaced by "time"
<li> leading "f" replaced by "freg"
<li> "-std replaced by "Std"
<li> "-mean" replaced by "Mean"
<li> "(t" replaced by "Time"
<li> opening brackets are removed
<li> closing brackets are removed
<li> commas replaced by underscore
<li> hyphens replaced by underscore
<li> "gravity" replaced by "Gravity"
</ul>
<li>(70)  Reorder columns so that *activy_name* follows *activity_id*.  The order of columns is:-
<ul>
<li>1.    subject_id    An integer [1:100] identifying the subject
<li>2.    activity_id   An integer [1:6] identifying the activity
<li>3.    activity_name A string describing the activity (e.g. WALKING)
<li>4-89  86 numeric measurements listed above
</ul>
<li>(80)  Write tidy dataframe to csv (working directory)
</ul>


Steps For Producing The Tidy Dataset
------------------------------------

<ol>
<li>Obtain Source Data
<ul>
<li>Download source file from the locaton identified above. 
<li>Unzip data.  This will create the directory structure mentioned above.
<li>Move files so that the set of files identified above exist in the working directory.
</ul>
<li>Run R Script
<ul>
<li>Open the RStudio application
<li>Open the R script run_analysis.R
<li>Set the working directory (i.e. where the source files are)
<li>Run the R script (run_analysis.R)
</ul>
<li>Output
<ul>
<li>An output comma separated file called tidyDataFile.csv will exist in the working directory.
</ul>
</ol>

Limitations
-----------
<ol>
<li>The reading and massaging of the data is based on V1.0 of the source files.
<li>Source files must be in the working directory.
<li>Output file is written to the working directory.
</ol>

