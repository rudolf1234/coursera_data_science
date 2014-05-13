################################################################################################
## SCRIPT HEADER
################################################################################################
## coursera - Getting and Cleaning Data - Course Project
##------------------------------------------------------------------------------------------------
## Rudolf Stolz
## Version 1.0.0
## Date 140513

##------------------------------------------------------------------------------------------------
## library

##------------------------------------------------------------------------------------------------
## variables
data.directory <- "data"

##----------------------------------------------------------------------------------------------
## check if the data directory holding the data exist
##----------------------------------------------------------------------------------------------
if (!file.exists(data.directory)) {
   data.raw <- paste("data directory does not exist: ", sep=" ")
   stop("data.directory")
}

##------------------------------------------------------------------------------------------------
## load X_test.txt, y_test.txt and combine them data.test
X.test <- read.table(paste(getwd(), data.directory, "X_test.txt", sep="/"), quote="\"")
Y.test <- read.table(paste(getwd(), data.directory, "Y_test.txt", sep="/"), quote="\"")

data.test <- cbind(Y.test,X.test)

##------------------------------------------------------------------------------------------------
## load X_train.txt, y_train.txt and combine them data.train
X.train <- read.table(paste(getwd(), data.directory, "X_train.txt", sep="/"), quote="\"")
Y.train <- read.table(paste(getwd(), data.directory, "Y_train.txt", sep="/"), quote="\"")

data.train <- cbind(Y.train,X.train)

##------------------------------------------------------------------------------------------------
## merge the datasets data.test and data.train
data.merged <- rbind(data.test, data.train)

##------------------------------------------------------------------------------------------------
## load features features.txt
data.features <- read.table(paste(getwd(), data.directory, "features.txt", sep="/"), quote="\"",
                            stringsAsFactors = FALSE)

##------------------------------------------------------------------------------------------------
## add feature names to data.merged
names(data.merged) <- c("activity", gsub("-","",data.features$V2))

##------------------------------------------------------------------------------------------------
## reduce the data set data.merged to the columns containing the terms "mean" or "std"
## take care not to remove the "activity" column
data.merged1 <- data.merged[,"activity"]
data.merged2 <- data.merged[grep("mean|std", names(data.merged), value = TRUE)]

data.merged <- cbind(data.merged1, data.merged2)
names(data.merged)[1] <- "activity"

##------------------------------------------------------------------------------------------------
## load activity labels activity_labels.txt
data.activitylabel <- read.table(paste(getwd(), data.directory, "activity_labels.txt", sep="/"), 
                                 quote="\"",
                                 stringsAsFactors = FALSE)

##------------------------------------------------------------------------------------------------
## replace the activity numbers by proper activity names
data.merged$activity <-as.factor(data.merged$activity)
levels(data.merged$activity) <- data.activitylabel$V2

##------------------------------------------------------------------------------------------------
## final tidy data set
data.tidy <- data.merged

##------------------------------------------------------------------------------------------------
## export data.tidy to the file "tidy_data_set.txt" in the R working directory
write.table(data.tidy, file=paste(getwd(), "tidy_data_set.txt", sep="/"), sep="\t",
            col.names=TRUE)

##------------------------------------------------------------------------------------------------
## calculate mean for each activity
data.tidy.mean <- as.data.frame(as.table(tapply(data.tidy[,2],data.tidy[,1], mean)))

for (i in 3:ncol(data.tidy)){
   temp <- as.data.frame(as.table(tapply(data.tidy[,i],data.tidy[,1], mean)))
   data.tidy.mean <- cbind(data.tidy.mean,temp[,2])                  
}

names(data.tidy.mean) <- names(data.tidy)

##------------------------------------------------------------------------------------------------
## export data.tidy.mean to file "tidy_data_set_mean.txt" in the R working directory
write.table(data.tidy.mean, file=paste(getwd(), "tidy_data_set_mean.txt", sep="/"), sep="\t",
            col.names=TRUE)

                      
                      
                      
                      
                     
