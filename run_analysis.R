# Obtain the observations from the features of the training data and the test data
train1 <- read.table("UCI HAR Dataset/train/X_train.txt", stringsAsFactors = FALSE)
test1 <- read.table("UCI HAR Dataset/test/X_test.txt", stringsAsFactors = FALSE)

# Obtain the subject info for the training data data observations
subject_train1 <- read.table("UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE)
subject_test1 <- read.table("UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE)

# Obtain the activity numbers for the training data and test data observations
activity_train1 <- read.table("UCI HAR Dataset/train/y_train.txt", stringsAsFactors = FALSE)
activity_test1 <- read.table("UCI HAR Dataset/test/y_test.txt", stringsAsFactors = FALSE)

# Obtain the activity names for corresponding activity numbers
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)[,2]

# Factorize and gather the activity numbers
factivity <- factor(c(activity_train1$V1, activity_test1$V1))

# Label the activity numbers with the proper activity labels
activity <- factor(factivity, labels = activity_labels)

# Obtain and create all the columns of the data set
variable_names <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)$V2
variable_names <- c(variable_names, "Subject", "Activity")

#Gather the bloblocks of data
col_block1 <- rbind(train1, test1)
col_block2 <- rbind(subject_train1, subject_test1)
col_block3 <- activity

# Combine to make one data set with their proper column names
data <- cbind(col_block1, col_block2)
data <- cbind(data, col_block3)
names(data) <- variable_names

# Obtain all the column names with "mean" or "std" in them
meanNstdData <- grepl("mean|std", variable_names)

# Create a new data table that only has their column names containing "mean" or "std"
extractedData <- data[,which(meanNstdData)]

# Obtain a new table with the mean of each variable of "data" (per "Subject" and "Activity")
tidy_data <-aggregate(. ~Subject + Activity, data, mean)
write.table(tidy_data, "tidy data.txt")