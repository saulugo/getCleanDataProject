#Before you run the script
This script uses the following R libraries:
- plyr
- dplyr

So **BEFORE** you run the script you must install these packages:
> install.packages("plyr")

> install.packages("dplyr")

#How to run this script
Please follow these steps:

1. Clone this repo or if preferred, create a working directory and download the script file *run_analysis.R* into it.

2. Download the experiments dataset from this link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

3. **IMPORTANT NOTE:** the .zip file must be unzipped **inside** the working directory.

4. Source the run_analysis.R script:
> source("run_analysis.R")

5. Call the function readData("the_name_of_your_dataset_directory")
> readData(directory) #directory is a string with the name of the directory of the dataset

6. **IMPORTANT NOTE:** the function readData receives as a parameter the name of the directory in which the experiment dataset is located. 

7. Wait a little while the script runs (it might take a couple of minutes!)

8. When the script ends, a file named **summary_data.txt** must has been created inside the working directory.

9. The file mentioned in the step 8 is the end result required in the question number 5 of the project description.
