            -- Exercise 1:Design a table
DROP DATABASE IF EXISTS Extra_Assignment;
CREATE DATABASE Extra_Assignment;
use Extra_Assignment;

DROP TABLE IF EXISTS Trainee3;
CREATE TABLE Trainee3(
		TraineeID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
		Full_Name 			VARCHAR(20) NOT NULL UNIQUE KEY,
		Birth_Date 			DATETIME NOT NULL,
		Gender 				ENUM('male','female','unknown')NOT NULL,
        ET_IQ 				TINYINT UNSIGNED NOT NULL,
		ET_Gmath 			TINYINT UNSIGNED NOT NULL,
        ET_English 			TINYINT UNSIGNED NOT NULL,
		Training_Class 		VARCHAR(25) NOT NULL,
        Evaluation_Notes	VARCHAR(50)  NULL
);


			-- Exercise 2: Data Types
DROP TABLE IF EXISTS Data_Types_1;
CREATE TABLE Data_Types_1(
	ID				TINYINT UNSIGNED 	PRIMARY KEY 	AUTO_INCREMENT,
	`Name`			VARCHAR(50) 		UNIQUE KEY 		NOT NULL,
	`Code`			VARCHAR(5) 							NOT NULL,
	ModifiedDate	DATETIME DEFAULT Now()
);


			-- Exercise 3: Data Types (2)
DROP TABLE IF EXISTS Data_Types_1;
CREATE TABLE Data_Types_1(
	ID				TINYINT UNSIGNED 	PRIMARY KEY	 AUTO_INCREMENT,
	`Name`			VARCHAR(50) 		UNIQUE KEY	 	NOT NULL,
	BirthDate		DATETIME 							NOT NULL,
	Gender			ENUM('male','female','unknown'	)	NOT NULL,
    IsDeletedFlag   BIT DEFAULT 1
);           
