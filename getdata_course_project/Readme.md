Coursera - Getting and Cleaning Data - Course Project
========================================================

## Author
Rudolf Stolz  
Version 1.0.0  
Date 140513  

## Task
perform the "Coursera - Getting and Cleaning Data - Course Project"

## Directory/File Overview  
* Readme.md  
   provides a short overview of the related files and the handling of the R script  

* CodeBook.md  
   provides a detailed description of the Data Preparation, R Script Explanation, Execution and Result   
   
* run_analysis.R   
   this is the R script analyzing the provided raw data

* tidy_data_set.txt   
   this is the tidy data set as a result of the execution of the R script run_analysis.R   
   
* tidy_data_set_mean.txt   
   this is the result of the mean calculation on the tidy data set as a result of the execution of the R script run_analysis.R   
   
## Data Preparation, R Script Execution and Result  
the following describes in detail the handling of the different data source files and the R script  
* create the directory "data" in your R working directory  

* download the file getdata-projectfiles-UCI HAR Dataset.zip from the Internet, store and unzip it in a temp directory and copy the following files to the above created directory "data"   
   * X_test.txt  
   * y_test.txt  
   * X_train.txt 
   * y_train.txt  
   * features.txt 
   * activity_labels.txt   

* execute the R script run_analysis.R in your R working directory  

* the script will generate the following two files in your R working directory  
   * tidy_data_set.txt  
   * tidy_data_set_mean.txt  

## Code Book  
refer to file CodeBook.md to get the details
