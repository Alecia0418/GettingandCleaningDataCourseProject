# This R script will:
## Download original data first from:
##https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## Set working directory to the location of your data
setwd("~/Documents")

## Set variables to make running the program easier:
local.dir <- './UCI HAR Dataset'
tidy.avgs.file <- './tidy_UCIHAR_avgs_data.txt'

# 1. Merges the training and the test sets to create one data set.
## Read tables in.

trainX <- read.table(paste(local.dir, 'train', 'X_train.txt', sep = '/'),
                    header = FALSE)
testX <- read.table(paste(local.dir, 'test', 'X_test.txt', sep = '/'),
                              header = FALSE)

trainY <- read.table(paste(local.dir, 'train', 'y_train.txt', sep = '/'),
                      header = FALSE)
testY <- read.table(paste(local.dir, 'test', 'y_test.txt', sep = '/'),
                     header = FALSE)

trainS <- read.table(paste(local.dir, 'train', 'subject_train.txt',
                                  sep = '/'), header = FALSE)
testS <- read.table(paste(local.dir, 'test', 'subject_test.txt',
                                 sep = '/'), header = FALSE)

## Read in labels.
act <- read.table(paste(local.dir, 'activity_labels.txt', sep = '/'), header = FALSE)
names(act) <- c('id', 'name')
feature <- read.table(paste(local.dir, 'features.txt', sep = '/'), header = FALSE)
names(feature) <- c('id', 'name')

##Assign names to datasets.
names(trainX) <- feature$name
names(trainY) <- c('activity')
names(trainS) <- c('subject')
names(testX) <- feature$name
names(testY) <- c('activity')
names(testS) <- c('subject')

## rbind tables.
X <- rbind(trainX, testX)
Y <- rbind(trainY, testY)
S <- rbind(trainS, testS)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.

X <- X[, grep('mean|std', feature$name)]

# 3. Uses descriptive activity names to name the activities in the data set

Y$activity <- act[Y$activity,]$name

# 4. Appropriately label the data set with descriptive activity names.
## All labels applied in #1, so this needs to create a tidy data set
final.set <- cbind(S, Y, X)

# 5. Create a 2nd, independent tidy data set with the average of each variable for each activity 
##and each subject.

tidy.avgs.set <- aggregate(tidy.set[, 3:dim(tidy.set)[2]],
                                list(tidy.set$subject,
                                     tidy.set$activity),
                                mean)
names(tidy.avgs.set)[1:2] <- c('subject', 'activity')

## Export
write.csv(tidy.avgs.set, tidy.avgs.file)
