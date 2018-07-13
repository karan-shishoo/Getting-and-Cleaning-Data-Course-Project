# Saving the provided tables for later use

features        <- read.table("./features.txt",header=FALSE)
activity_Labels   <- read.table("./activity_labels.txt",header=FALSE)

subject_Train    <-read.table("./train/subject_train.txt", header=FALSE)
x_Train          <- read.table("./train/X_train.txt", header=FALSE)
y_Train          <- read.table("./train/y_train.txt", header=FALSE)

subject_Test    <-read.table("./test/subject_test.txt", header=FALSE)
x_Test         <- read.table("./test/X_test.txt", header=FALSE)
y_Test         <- read.table("./test/y_test.txt", header=FALSE)

# Assigning column names for ease of reading

colnames(activity_Labels)<-c("activity_Id","activity_Type")

colnames(subject_Train) <- "subject_Id"
colnames(x_Train) <- features[,2]
colnames(y_Train) <- "activity_Id"

colnames(subject_Test) <- "subject_Id"
colnames(x_Test) <- features[,2]
colnames(y_Test) <- "activity_Id"

# merging the data - (#1)

train_Data <- cbind(y_Train,subject_Train,x_Train)
test_Data <- cbind(y_Test,subject_Test,x_Test)

final_Data <- rbind(train_Data,test_Data)

# Extracting only the measurements on the mean and standard deviation for each measurement - (#2)
mean_std_data <-final_Data[,grepl("mean|std|subject_Id|activity_Id",colnames(final_Data))]

# Using descriptive activity names to name the activities in the data set
library(plyr)

mean_std_data <- join(mean_std_data, activity_Labels, by = "activity_Id", match = "first")

mean_std_data <- mean_std_data[,-1]

#4. Appropriately labeling the data set with descriptive variable names

names(mean_std_data) <- gsub("\\(|\\)", "", names(mean_std_data), perl  = TRUE)

names(mean_std_data) <- make.names(names(mean_std_data))

names(mean_std_data) <- gsub("Acc", "Acceleration", names(mean_std_data))
names(mean_std_data) <- gsub("^t", "Time", names(mean_std_data))
names(mean_std_data) <- gsub("^f", "Frequency", names(mean_std_data))
names(mean_std_data) <- gsub("BodyBody", "Body", names(mean_std_data))
names(mean_std_data) <- gsub("mean", "Mean", names(mean_std_data))
names(mean_std_data) <- gsub("std", "Standard Deviation", names(mean_std_data))
names(mean_std_data) <- gsub("Freq", "Frequency", names(mean_std_data))
names(mean_std_data) <- gsub("Mag", "Magnitude", names(mean_std_data))


tidydata_average_sub<- ddply(mean_std_data, c("subject_Id","activity_Type"), numcolwise(mean))

write.table(tidydata_average_sub,file="tidydata.txt")


