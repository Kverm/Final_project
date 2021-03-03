library(dplyr)

# combine test and train variable sets
trainX <- read.table("X_train.txt", sep = "")
testX <- read.table("X_test.txt", sep = "")
setX <- rbind(trainX, testX)

# add (lower case) descriptive variable names and select only means and stds
feature_labels <- read.table("features.txt")[, 2]
names(setX) <- tolower(feature_labels) 
setX <- setX[, grep("mean\\()|std\\()", names(setX))]

# combine activity data and add
trainY <- read.table("y_train.txt", col.names = "activity")
testY <- read.table("y_test.txt", col.names = "activity")
setY <- rbind(trainY, testY)
setX <- cbind(setX, setY)

# combine subject data and add
train_subjects <- read.table("subject_train.txt", col.names = "subject")
test_subjects <- read.table("subject_test.txt", col.names = "subject")
subjects <- rbind(train_subjects, test_subjects)
setX <- cbind(setX, subjects)

# add column with descriptive activity labels
activity_labels <- read.table("activity_labels.txt", col.names = c("activity", "activity_description"))
setX <- merge(setX, activity_labels, by = 'activity')
setX <- setX[, which(names(setX) != "activity")]

# remove superfluous dataframes
rm(list = ls()[which(ls() != "setX")])

# create tidy data with summary of the mean of variables
set_mean <- setX %>%
              group_by(activity_description, subject) %>%
              summarise_all(mean)

write.table(set_mean, "tidy_set.txt", row.names = FALSE)