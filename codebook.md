# Introduction

The script `run_analysis.R`performs the 5 steps described in the course project's definition.

* Data tables by were concatenated using `rbind()` function. By similar, we address those files having the same number of columns and referring to the same entities.
* Then, Subset 'Name of Features' by measurements on the mean and standard deviation and Subset the data frame 'Data' by seleted names of Features
* And, factorize Variable activity in the data frame Data using descriptive activity names
* Next this part, Names of Features will labelled using descriptive variable names. names corrected.
* Finally, independent tidy data set will be created with the average of each variable for each activity and each subject based on the data set in previous step..

# Variables

* `dataActivityTest`, `dataActivityTrain`, `dataSubjectTrain`, `dataSubjectTest`, `dataFeaturesTest` and `dataFeaturesTrain` contain the data from the downloaded files.
* `dataSubjectTrain`, `dataSubjectTest` merge and `dataSubject` variable created.
* `dataActivityTrain`, `dataActivityTest` merge and `dataActivity` variable created.
* `dataFeaturesTrain`, `dataFeaturesTest` merge and `dataFeatures` variable created.
* later on `dataSubject` and `dataActivity` combined to create variable `dataCombine` that been merge with `dataFeatures` to comes up with the `Data` data frame
* `Data2` data frame created with the average of each variable for each activity and each subject based on the `Data`  