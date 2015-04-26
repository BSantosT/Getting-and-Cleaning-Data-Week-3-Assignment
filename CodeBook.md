Data Source  
===========
This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Dataset Information
===================
Below are the signals that were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  
tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals (for the purpose of this assingment) are:   
mean(): Mean value  
std(): Standard deviation  

Data Transformation
===================

The raw data sets are processed with run_analisys.R script to create a tidy data set  

1 Merge training and test sets  
==
Test and training data (X_train.txt, X_test.txt), subject ids (subject_train.txt, subject_test.txt) and activity ids (y_train.txt, y_test.txt) are merged to obtain a single data set. Variables are labelled with the names assigned by original collectors (features.txt).  

2 Extract mean and standard deviation variables  
==
From the merged data set is extracted and intermediate data set with only the values of estimated mean (variables with labels that contain "mean") and standard deviation (variables with labels that contain "std").  

3 Use descriptive activity names
==
A new column is added to intermediate data set with the activity description. Activity id column is used to look up descriptions in activity_labels.txt.

4 Label variables appropriately
==
Labels given from the original collectors were changed:
to obtain valid R names without parentheses, dashes and commas
to obtain more descriptive labels

5 Create a tidy data set
==
From the intermediate data set is created a final tidy data set where numeric variables are averaged for each activity and each subject.

The tidy data set contains 10299 observations with 81 variables divided in:  
-an activity label (Activity): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  
-an identifier of the subject who carried out the experiment (Subject): 1, 3, 5, 6, 7, 8, 11, 14, 15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29, 30  
-a 79-feature vector with time and frequency domain signal variables (numeric)  

For variables derived from mean and standard deviation estimation, the previous labels are denoted with the terms "Mean" or "StandardDeviation".

The data set is written to the file sensor_avg_by_act_sub.txt.

