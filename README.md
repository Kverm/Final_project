Transformation Of The "Human Activity Recognition Using Smartphones" Dataset
Version 1.0
============================================================================
Koen Vermeij
============================================================================

The following files are included in this github repo:

- 'README.md'

- 'CodeBook.md'

- 'run_analysis.R'


The 'run_analysis.R' script uses the "Human Activity Recognition Using Smartphones" dataset created by 
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto and Davide Anguita, and manipulates and transforms the data
into a new tidy dataset. When run, the following actions are performed:

1. The test and training datasets are merged into a single dataset.

2. Only the measurements on the mean and standard deviation for each measurement are extracted.

3. Subject and descriptive activity data are added.

4. The dataset is labeled with descriptive variable names.

5. An independent tidy data set with the average of each variable for each activity and each subject is created.


Running the script requires the following files to be present in the same directory as the script:

- 'features_info.txt'

- 'features.txt'

- 'activity_labels.txt'

- 'train/X_train.txt'

- 'train/y_train.txt'

- 'test/X_test.txt'

- 'test/y_test.txt'


The 'CodeBook.md' file provides further information about the measurements and units, the resulting variables and the
variables that ultimately have been included in the tidy dataset created by the 'run_analysis.R' script
