#Code Book
In order to create a merged dataset that contains both, the train and the test data, two dataframes were created:
- testDF
- trainDF

**testDF** is the result of bind by column the following datasets:
- subject_test #this dataset contains the test experiments subjects_id
- y_test #this dataset contains the test experiments activity_id
- x_test #this dataset contains the test experiments measurements

In the same way, **trainDF**  is the result of bind by column the following datasets:
- subject_train #this dataset contains the train experiments subjects_id
- y_train #this dataset contains the train experiments activity_id
- x_train #this dataset contains the train experiments measurements

After build these two dataframes, testDF and trainDF, a dataframe with the merged data of test and train was created with the command:
> mTestTrain = merge(testDF,trainDF,all=TRUE)

**mTestTrain** dataframe has all the colums of the y, x and subject datasets.

An auxiliary dataframe (named X in the script) was created with the 561 variables of each measurement using the select method:

> x <- select(mTestTrain,V1:V561)

The objective of the x DF is to calculate the mean and the standard deviation of each row of this dataframe, which means to calculate the mean and standard deviation of each measurement of the experiment.

##mTestTrain dataframe structure
Then a final dataframe named **mTestTrain** was created. This dataframe contains the following columns:

- **activity_id**: has the values of the ID of each activity as follow:
  - 1: WALKING
  - 2: WALKING_UPSTAIRS
  - 3: WALKING_DOWNSTAIRS
  - 4: SITTING
  - 5: STANDING
  - 6: LAYING
- **subject_id:** has the IDs of each subject in the experiment. The range of the values is 1 to 30
- **measurements_means:** has the means of the 561 variables of each measurement
- **measurements_SD:** has the standard deviation of the 561 variables of each measurement
- **activity_name:** has the descriptive name for each activity_id

##summary_data dataframe structure
The *summary_data* dataframe was created applying a ddply function (from the plyr library) to the *mTestTrain* dataframe:
> summary_data <- ddply(mTestTrain,~subject_id~activity_name,summarise,mean=mean(measurements_means),mean_SD=mean(measurements_SD))

The *summary_data* dataframe has the following columns:
- **subject_id:** the subject_id of each subject in the experiment
- **activity_name:** the descriptive name of each activity in the experiment
- **measurements_mean:** the mean of all the measurements means for each subject and each activity
- **measurements_SD_means:** the mean of all the measurements standard deviations for each subject and each activity






