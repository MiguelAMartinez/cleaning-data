# Code Book
This code book describes each variable and the transformations performed to collect and clean the raw data. 

## Variables
A variable corresponds to a column on the data table. 

Subject: The number of the subject who performed the activity for each window sample. Its range is from 1 to 30. Notice that a number is used, instead of a name, to protect the subjects' privacy. 

Activity: The action performed by a subject. The possible actions were walking, walking upstairs, walking downstairs, sitting, standing, and laying. 

All the other ones: The measurement of the action performed. The words in the variable name describe this action. 
	- t: Time
	- f: Frequency domain signals
	- BodyAcc: Body acceleration signal
	- BodyGyro: Body gyroscope
	- GravityAcc: Gravity acceleration signal 
	- Jerk: Jerk signal 
	- Mag: Euclidean norm
	- Mean: Mean
	- Std: Standard deviation 
	- X: Signal in the X direction 
	- Y: Signal in the Y direction 
	- Z: Signal in the Z direction 

The variable names of the tidy data are descriptive since they contain no special characters (such as "." or "-") and because the names are related to the function of the data. Note that some words in the variable names were abbreviated (e.g. "t" instead of "time") since having 5 - 7 full words in each variable name would make the table less presentable. 