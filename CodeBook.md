## Overview 
This codebook contains detailed instructions for combining and reformatting the UCI Human Activity Recognition Dataset, described in further detail at the source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This data set is comprised of a series of accelerometer readings taken from smartphones. There were thirty participants who took part in five activities: 

1. Laying
2. Sitting
3. Standing
4. Walking
5. Walking Down Stairs
6. Walking Up Stairs

>Citation: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.


##Data Set Description:

A description of the individual measurements can be obtained from the original study provided at the link above, and described in greater detail in the file "features_info.txt" in the original data source (pasted below for convenience).  

In the tidy data set, we are only reporting the measurements of the mean() and std(), with multiple measurements aggregated for individual participants within each activity. Column names in the tidy data set have been modified for maximum compatibility with R; dashes were changed to underscores, and the parentheses were removed: e.g. "tBodyAcc-X-mean()" has become "tBodyAcc_X_mean" in the tidy data set.  Otherwise, the names are identical to those described in the original data source. 

From the original publication (cited above):  

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.  
 
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).  
 
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). \ 

> These signals were used to estimate variables of the feature vector for each pattern:   
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  
 
> * tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag
 
> The set of variables that were estimated from these signals are: 

> * mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.
 
> Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable: 

> * gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

> The complete list of variables of each feature vector is available in 'features.txt'


## Data Analysis

All data analysis is handled by the script run_analysis.R.  The script either needs to be executed in the same directory as the 'UCI HAR Dataset' directory, or by passing the directory to the the data_format() function in the script.  The script will return two files:  tidy_data.csv, and unsummarized_data.csv.  For more details on executing the script, please refer to the README.md file provided in this repository. 
  

