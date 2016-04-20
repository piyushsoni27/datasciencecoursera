run_analysis <- function(){
  setwd("UCI HAR Dataset/")
  
  features <- read.table("features.txt", colClasses = "character")
  activity_label <- read.table("activity_labels.txt", colClasses = "character")
  X_train <- read.table("train/X_train.txt")
  y_train <- read.table("train/y_train.txt")
  X_test <- read.table("test/X_test.txt")
  y_test <- read.table("test/y_test.txt")
  subject_train <- read.table("train/subject_train.txt")
  subject_test <- read.table("test/subject_test.txt")
  
  X_merge <- rbind(X_train, X_test)
  y_merge <- rbind(y_train, y_test)
  subject_merge <- rbind(subject_train, subject_test)
  y_fact <- factor(y_merge$V1)
  levels(y_fact) <- activity_label$V2
  y_merge$V1 <- as.character(y_fact)
  
  feature_mean_std <- grep("mean\\()|std\\()", features$V2)
  X_merge_mean_std <- X_merge[feature_mean_std]
  
  final_data <- cbind(y_merge$V1, subject_merge$V1, X_merge_mean_std)
  colnames(final_data)[1] <- "activities"
  colnames(final_data)[2] <- "subject"
  colnames(final_data)[3:68] <- features$V2[feature_mean_std]
  
  final_data_avg_sub <- data.frame(matrix(nrow = 6, ncol = 0))
  final_data_avg_activity <- data.frame(matrix(nrow = 6, ncol = 0))
  
  for(name in names(final_data)[3:ncol(final_data)]){
    final_data_avg_activity <- cbind(final_data_avg_activity, data.frame(matrix(unlist(tapply(final_data[,name], final_data$activities, mean)))))
    final_data_avg_sub <- cbind(final_data_avg_sub, data.frame(matrix(unlist(tapply(final_data[,name], final_data$subject, mean)))))
  }
  
  colnames(final_data_avg_activity)[1:66] <- features$V2[feature_mean_std]
  colnames(final_data_avg_sub)[1:66] <- features$V2[feature_mean_std]
  final <- rbind(final_data_avg_activity, final_data_avg_sub)
  final <- cbind(subject = c(-5:30), final)
  
  name <- names(tapply(final_data[,3], final_data$activities, mean))
  final$subject[1:6] <- NA
  final <- cbind(activities = name, final)
  final$activities[7:36] <- NA
  
  setwd("..")
  return(final)
}