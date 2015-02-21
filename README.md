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

The script will write out two files:

* _tidy\_data.csv_ : a summarized version of the data set containing the average values of mean and standard deviation of measurements per participant in each activity
* _unsummarized\_data.csv_ : the formatted and joined data prior to the aggregation step that generates tidy_data.csv
