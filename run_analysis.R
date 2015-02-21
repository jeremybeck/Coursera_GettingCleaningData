## This R script contains the the code to load, analyze, and return a tidy data set from the UCI Human Activity Recognition Data Set
## The script searches for an expanded /UCI HAR Dataset/ folder in the working directory. 
## The script will write two output files:
##     - tidy_data.csv - which is a summarized version of the data set as outlined in the README.md file provided with this script
##     - unsummarized_data.csv - the processed and formatted data that has not aggregated multiple readings per Subject/Activity into a single row.  
## The "tidy" data set requested for the Coursera course is the first file, tidy_data.csv 
## All R code to format the data is stored in the function data_format(), so that the user can import this file into their environment
## and continue working with the data returned by the analysis without reloading it into their environment

data_format <- function(dir = './UCI HAR Dataset/', write_data = T) {
  # Loads, formats, and returns data.  The function takes two optional arguments, 'dir', which is the path to the UCI HAR Dataset
  # and "write_data", which tells R whether or not to output the processed data to a flat file
  
  library(dplyr, quietly=T)
  
  # Define the base folder by the path specified in the function.  Default value is the folder '/UCI HAR Dataset' in the working directory.
  # Data was downloaded from the URL: 
  path <- dir
  
  message("Hunting for data in ", path)
  # Now append the training and test folder names to the base path. 
  train_path <- paste(path,'/train/',sep="")
  test_path <- paste(path,'/test/',sep="")
  
  ### Load Files from the Subdirectories './train' and './test'.  The course assignment wasn't specific
  ### So we are going to assume that directory structure and file format are going to be considered fixed.
  
  # First the training data - concatenate (paste) the training path with the relevant file names
  # In that case, we don't need to specify any arguments to read.table() other than the file name. 
  train_acts <- read.table(paste(train_path,'y_train.txt', sep=''))
  train_data <- read.table(paste(train_path,'x_train.txt', sep=''))
  train_subject <- read.table(paste(train_path,'subject_train.txt', sep=''))
  
  # Now the test data - concatenate (paste) the test path with the relevant file names
  test_acts <- read.table(paste(test_path,'y_test.txt', sep=''))
  test_data <- read.table(paste(test_path,'x_test.txt', sep=''))
  test_subject <- read.table(paste(test_path,'subject_test.txt',sep=''))
  
  # Grab the feature names from the feature.txt file
  
  feature_names <- read.table(paste(path,'features.txt', sep=''), stringsAsFactors=F)
  
  # And the Activity Labels table
  
  act_labels <- read.table(paste(path,'activity_labels.txt', sep=''), stringsAsFactors=F)
  colnames(act_labels) <- c("Activity_ID", "Activity")
  
  message("Data Loaded - Moving to Formatting")
  
  ### Start Combining Columns for training and test data using cbind(), then rbind()
  ### Add column names for accelerometer data from the name column (2) of the feature_names object
  
  train_combined <- cbind(train_subject, train_acts, train_data)
  colnames(train_combined) <- c("Subject_ID","Activity_ID", feature_names[[2]])
  
  test_combined <- cbind(test_subject, test_acts, test_data)
  colnames(test_combined) <- c("Subject_ID","Activity_ID", feature_names[[2]])
  
  # Concatenate the Training and Test Data Sets into one data frame
  all_data <- rbind(train_combined, test_combined)
  
  # Subset the columns to only take those specifying the mean() or std() matching either 'mean()' or 'std()' with the grep command
  # Double backslashes are necessary to include parentheses in the grep command. 
  mean_std_cols <- grep('mean\\()|std\\()',colnames(all_data))
  used_cols <- c(1,2,mean_std_cols)
  all_data <- all_data[used_cols]
  
  # Let's do a little column name reformatting to get rid of parentheses and dashes, because people are afraid of them. Tip: Reference those columns using df[['name']] or df$'name'  
  colnames(all_data) <- as.character(lapply(colnames(all_data), function(x) { gsub('\\(\\)','', x)}))
  colnames(all_data) <- as.character(lapply(colnames(all_data), function(x) { gsub('\\-','_', x)}))
  colnames(all_data) <- as.character(lapply(colnames(all_data), function(x) { gsub('BodyBody','Body',x)})) 

  # Reformat the Activity labels here - let's be explicit and not assume any packages exist to automate this
  
  all_data <- merge(all_data, act_labels, by.x="Activity_ID", by.y="Activity_ID", all.x=T)
  all_data$Activity_ID <- NULL   # Delete this column as it isn't useful anymore
  
  message("Formatting Completed - Huzzah!")
  
  message("Summarizing Data by Subject and Activity")
  
  ## The summary can be handled using a dplyr chain.
  ## We are going to order by Activity First, then Subject - I find it much easier to analyze across subjects that way
  
  tidy_data <- all_data %>% group_by(Activity, Subject_ID) %>% summarise_each(funs(mean))
  
  if (write_data == TRUE) { 
    message("Writing Output Files")
    write.csv(tidy_data,row.names=F,file="tidy_data.csv")
    write.csv(tidy_data,row.names=F,file="unsummarized_data.csv")
  }

  return(tidy_data)
  
}  

tidy_data <- data_format()