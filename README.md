
GCD_Project
===========

Course project for the Getting and Cleaning Data course

==================================================================

A tidy data set developed for the Getting and Cleaning Data Course

 #Human Activity Recognition Using Smartphones Dataset#
 
==================================================================

   This repository contains the R script and associated information code for building a tidy data set
from the Human Activity Recognition dataset.  In this file, we present only the information necessary for the
present purposes.  A description of this database and futher information about this dataset can be obtained at
the following link (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Instructions
==================================================================

   The contents of this repository are as follows:

   1. run_analysis.R  -- The R script for processing the UCI HAR Dataset into a tidy dataset
   2. CodeBook.md     -- A codebook describing the data
   3. README.md       -- A description of the current project and instructions for use.

   In addition, the user of this script will need to have complete copy of the UCI HAR Dataset which may be obtained at the following link.

http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

   After downloading this zip file, unzip it and be sure that the directory 'UCI HAR Dataset' is in the same directory as the script run_analysis.R.

   Then run the script run_analysis.R.  This should result in a txt file HAR_data.txt appearing in the same directory.  This is the necessary tidy data set.
 

Description of the script run_analysis.R
=========================================

    The R script process the original HAR data in the following way:

   1. After loading all the test and training data into R, as well as the information about the subjects and
activity codes, the script first binds the subject and activity codes to their respective dataframes.  It then
merges the test and training data into one dataframe called 'data'.

   2. The script than proceeds to select only those columns whose names (which come originally from the features.txt
file) have the 'mean' and 'std' in them.  The first two columns -- containing subject and activity code -- are retained.
 
   3. The step involving binding the activity names as columns alongside their numerical codes is deferred until after
 the second independent data set is produced by averaging each variable over the aggregate of each pair of subject and
activityCode combination is computed.

   4.  The final result is written to the file HAR_data.txt

 
