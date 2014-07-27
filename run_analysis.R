
#  The following R script performs the following steps:
#  1. Merges the training and the test sets to create one data set.
#  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#  3. Uses descriptive activity names to name the activities in the data set
#  4. Appropriately labels the data set with descriptive variable names.
#  5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject


# Read all the test and train data from the given text files

test_subs <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test <- read.table("./UCI HAR Dataset/test/x_test.txt")
test_acts <- read.table("./UCI HAR Dataset/test/y_test.txt")

train_subs <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train <- read.table("./UCI HAR Dataset/train/x_train.txt")
train_acts <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Attach appropriate column names to all the data.frames

cols <- read.table("./UCI HAR Dataset/features.txt")

colnames(test_subs) <- "subject"
colnames(test) <- cols[,2]
colnames(test_acts) <- "activityCode"

colnames(train_subs) <- "subject"
colnames(train) <- cols[,2]
colnames(train_acts) <- "activityCode"

# Attach the subject and activity information to the training and test data sets

test <- cbind(test_subs, test_acts, test)
train <- cbind(train_subs, train_acts, train)

# 1. Merge the training and the test sets to create one data set. 

data <- rbind(test,train)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
#    This is done by matching the strings 'mean' and 'std' in the names given for the columns
#    in the features.txt file. 

mf <- function(x){
 as.logical(grep("mean",x))
}
m <- sapply(colnames(data), mf)
m[is.na(m)] <- FALSE

sf <- function(x){
  as.logical(grep("std",x))
}
s <- sapply(colnames(data), sf)

x <- as.logical(s) | as.logical(m)
x[is.na(x)] <- FALSE

x[1] <- TRUE   # Always include the first two columns
x[2] <- TRUE


data <- data[,x]

# 3. Uses descriptive activity names to name the activities in the data set
#    We attach the descriptive activity labels as an additional column alongside the coded numbers

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
data <- cbind(data[,1:2], activity_labels[data[,2]], data[,3:dim(data)[2]])
colnames(data)[3] <- "activityName"

write.table(data, "./HAR_data.txt")


