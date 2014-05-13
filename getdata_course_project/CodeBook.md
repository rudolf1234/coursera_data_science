Coursera - Getting and Cleaning Data - Course Project
========================================================

## Author
Rudolf Stolz  
Version 1.0.0  
Date 140513  

## Task
perform the "Coursera - Getting and Cleaning Data - Course Project"

## Background Information from the Raw Data   
the following data is taken from getdata-projectfiles-UCI HAR Dataset.zip --> features_info.txt   

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.  

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).  

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).  

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are:  
mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:  
gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

## Data Preparation    
* create the directory "data" in your R working directory  

* download the file getdata-projectfiles-UCI HAR Dataset.zip from the Internet, store and unzip it in a temp directory and copy the following files to the above created directory "data"   
   * X_test.txt  
   * y_test.txt  
   * X_train.txt 
   * y_train.txt  
   * features.txt 
   * activity_labels.txt  
   
## R Script Explanation, Execution and Result
* define the directory in which the above mentioned data will be stored, relative to your R working directory  
  data.directory <- "data"  
  
* check that this directory exists; in case it is not available stop the further execution of the script and provide the warning "data directory does not exist" in the console  

* read the file X_test.txt (test set) and store the data in the data table X.test   
   dim(X.test)   
   [1] 2947  561  
   Note:  
   I have not added a check, that the mentioned file is present in the named directory; I simply assume, that the above mentioned data preparation has been done properly; I know, that this is not the best way, but it saved me for now some time - sorry!  
   this note just so applies to following read file algorithms!  

* read the file Y_test.txt (test activity labels) and store the data in the data table Y.test  
   dim(Y.test)  
   [1] 2947    1  

* merge the data tables X.test and Y.test and store the result in the data table data.test  
   the activity column of Y.test has been chosen as the first column  
   dim(data.test)   
   [1] 2947  562

* read the file X_train.txt (training set) and store the data in the data table X.train  
   be patient, this will take a while   
   dim(X.train)   
   [1] 7352  561

* read the file Y_train.txt (training activity labels) and store the data in the data table Y.train   
   dim(Y.train)   
   [1] 7352    1

* merge the data tables X.train and Y.train and store the result in the data table data.train   
   the activity col of Y.train has been chosen as the first column  
   dim(data.train)   
   [1] 7352  562

* merge the data tables data.test and data.train and store the result in data table data.merged   
   dim(data.merged)   
   [1] 10299   562

* read the file features.txt (name of the features) and store the data in the data table data.features   
   dim(data.features)   
   [1] 561   2

* add feature names ("activity" + data.features) to the data table data.merged; I have removed the character "-" from the feature names to make them more readable   

* remove from the data table data.merged all columns not having the terms "mean" or "std" in there column names  
   Note:   
   I have chosen all columns from the original data with the terms "mean" and "std" somewhere in the column name, since no further requirements are defined in the Coursera task description!  
   do not forget the column "activity"
   dim(data.merged)   
   [1] 10299    80
   
* read the file activity_labels.txt (name of the activities) and store the data in the data table data.activitylabel     
   
* replace the activity numbers of the data table data.merged column "activity"" by proper activity names (data.activitylabel)  

* copy the data of the data table data.merged to the final tidy data table data.tidy   
  Note:  
  normally this is not necessary, since it costs a lot of extra memory; nevertheless, I have done it to make the complete approach I have chosen easier to understand   
   dim(data.tidy)   
   [1] 10299    80

* export data table data.tidy to the file "tidy_data_set.txt" in the R working directory; I have chosen the tabulator "\t" as the column/feature separator   

* calculate for each activity (data.activitylabel) and each feature of the data table data.tidy the mean and store it in data table data.tidy.mean  
  dim(data.tidy.mean)   
  [1]  6 80

* export data table data.tidy.mean to file "tidy_data_set_mean.txt" in the R working directory; I have chosen the tabulator "\t" as the column/feature separator


