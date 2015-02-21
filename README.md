### Documentation for UCI HAR Data Set Analysis

This repository contains the following files:

* run_analysis.R
* README.md
* Codebook.md
* tidy_data.csv


##How to Execute the Script:

It is assumed that the "UCI HAR Dataset" directory has been downloaded and is unzipped in the working directory prior to execution of the script. If the data set has not been acquired, please refer to the links in the Codebook.md file for obtaining the data set.

The script can be executed by launching R and using the command:

```
source('./run_analysis.R)
```
Alternatively, the script can be executed from the command line (for example on Mac or Linux) using the command:

```
R --no-save < run_analysis.R
```

The script performs the following tasks:

1. Loads in the Training and Test set data contained in the subfolders ./train and ./test
2. Uses cbind to join the subject_ID, activity labels, and measurement vectors
3. Uses rbind to join the training and test sets
4. Appends useful activity names
5. Replaces column names from the features.txt file in the UCI HAR Dataset, and reformats the names for maximum R compatibility
6. Extract the subset of columns that contain mean() and std() measurements.
7. Aggregates repeat measurements for each subject within each activity using dplyr, and returns the mean of the multiple measurements
8. Outputs the spiffy, tidy data, as well as the formatted, unaggregated data

run_analysis.R will write out two files in the user's working directory:

* _tidy\_data.csv_ : a summarized version of the data set containing the average values of mean and standard deviation of measurements per participant in each activity
* _unsummarized\_data.csv_ : the formatted and joined data prior to the aggregation step that generates tidy_data.csv
