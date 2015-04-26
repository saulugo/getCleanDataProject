readData <- function(directory){
        # You must install the packages plyr and dplyr
        # install.packages("plyr")
        # install.packages("dplyr")
        library(plyr)
        library(dplyr)
        
        # The datasets must be in a directory inside your workding directory
        # the datasets directory name is passed to this function in the variable "directory"
        # Now, reading the datasets files for test and train
        myfile <- paste("./",directory,"/test/X_test.txt",sep="")
        x_test <- read.table(myfile)
        myfile <- paste("./",directory,"/test/y_test.txt",sep="")
        y_test <- read.table(myfile)
        y_test <- rename(y_test,activity=V1)
        myfile <- paste("./",directory,"/test/subject_test.txt",sep="")
        subject_test <- read.table(myfile)
        subject_test <- rename(subject_test,subject=V1)
        # forming the dataframe for the test data
        testDF <- cbind(subject_test,y_test,x_test)
        
        # reading the train datasets
        myfile <- paste("./",directory,"/train/X_train.txt",sep="")
        x_train <- read.table(myfile)
        myfile <- paste("./",directory,"/train/y_train.txt",sep="")
        y_train <- read.table(myfile)
        y_train <- rename(y_train,activity=V1)
        myfile <- paste("./",directory,"/train/subject_train.txt",sep="")
        subject_train <- read.table(myfile)
        subject_train <- rename(subject_train,subject=V1)
        # forming the dataframe for the train dataset
        trainDF <- cbind(subject_train,y_train,x_train)
      
        
        # merging the test and train dataframes
        # this answer the question number 1 of the project
        mTestTrain = merge(testDF,trainDF,all=TRUE)
        # forming a dataframe only with the measurements values
        x <- select(mTestTrain,V1:V561)
        # calculating the mean of each measurements
        myMeans <- rowMeans(x)
        # calculating the SD of each measurements
        mySDs <- apply(x,1,sd)
        # forming the df that only has the mean and SD for each measurement
        # this answer question number 2 of the project
        mTestTrain <- cbind(mTestTrain,myMeans,mySDs)
        mTestTrain <- select(mTestTrain,-(V1:V561))
        
        # reading the activity labels
        myfile <- paste("./",directory,"/activity_labels.txt",sep="")
        activity_labels <- read.table(myfile)
        # merging the activity labels with the dataset
        # this creates a column that has a descriptive activity name for each activity
        # this answer the question number 3 of the project
        mTestTrain = merge(mTestTrain,activity_labels,by.x="activity",by.y="V1",all=TRUE)
        # renaming the dataset columns. This answer the question number 4 of the project
        mTestTrain <- rename(mTestTrain,activity_id=activity,subject_id=subject,measurements_means=myMeans,measurements_SD=mySDs,activity_name=V2)
        
        # calculating a separate dataset with the mean of the means and the mean of the SD of each measurements
        # this answer the question number 5 of the project
        summary_data <- ddply(mTestTrain,~subject_id~activity_name,summarise,mean=mean(measurements_means),mean_SD=mean(measurements_SD))
        summary_data <- rename(summary_data,measurements_mean=mean, measurements_SD_means=mean_SD)
        write.table(summary_data,file="summary_data.txt",row.name=FALSE)
        
}