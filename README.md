#This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:
-Download the data if it does not already exist in the working directory
Load the activity and feature, Obtain the observations from the features of the training data and the test data



-Obtain the subject info for the training data and test data observations
We loads  the training and test datasets, we keep only those columns that shows a mean or standard deviation, Obtain all the column names with "mean" or "std" in them




-we load the activity and subject data for each dataset and merges the columns with the dataset
We merges the two datasets



-Factorize and gather the activity numbers,we convert the activity and subject columns into factors as required



-Then we create a tidy dataset which encompasses the average (mean) value of each variable for each subject and activity pair.
Then our end result is  tidy.txt