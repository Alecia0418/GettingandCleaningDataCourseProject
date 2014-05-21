GettingandCleaningDataCourseProject
===================================
1. Download and unzip this file to a local work directory on your computer:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2. Open run_Analysis.R and set the working directory to the folder where you want your R work directory to be.
    2a. By default, the program will set it to ~/Documents.
    
3. Make sure the data in the UCI HAR dataset folder is in the location listed in the program.  Otherwise, reset
    the local variables starting on line 7.

4. After making the changes, run the program, run_Analysis.R.

5. This program:
    5a. Merges the training and the test sets to create one data set.
    5b. Extracts only the measurements on the mean and standard deviation for each measurement. 
    5c. Uses descriptive activity names to name the activities in the data set
    5d. Appropriately labels the data set with descriptive activity names. 
    5e. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

6. You will get an exported tidy dataset in the form of a text file that is comma delimited to do with as needed.
