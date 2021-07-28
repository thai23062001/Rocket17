CREATE DATABASE TestingSystem;
use TestingSystem;

-- Tạo bảng 1 : Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	DepartmentID 	 	 INT,
	DepartmentName		 NVARCHAR(25)
);

-- Tạo Bảng 2 : Position
DROP TABLE IF EXISTS `Position`;
CREATE TABLE  `Position`(
	PositionID	 	 	INT,
	PositionName	 	INT 
);

-- Tạo Bảng 3 : Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE  `Account`(
	AccountID	 		INT,
	Email	 			NVARCHAR(50),
	Username 			NVARCHAR(50),
	fullName  			NVARCHAR(50),
	DepartmentID    	INT,
	PositionID 			INT,
	CreateDate			DATE
);

-- Tạo bảng 4 : Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE  `Group`(
	GroupID	 	 	   INT ,
	GroupName		   NVARCHAR(50),
	CreatorID	 	   INT,
	CreateDate		   DATE
);

-- Tạo bảng 5 : GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE  GroupAccount(
	GroupID	 	       INT ,
	AccountID	 	   INT,
	JoinDate	   	   DATE
);

-- Tạo Bảng 6 TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
	TypeID			INT,
	TypeName 		INT
);

-- Tạo Bảng 7 : CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE  CategoryQuestion(
	CategoryID	 	  INT,
	CategoryName	  NVARCHAR(50) 
);

-- Tạo bảng 8 : Question
DROP TABLE IF EXISTS Question;
CREATE TABLE  Question(
	QuestionID	 	 INT,
	Content	 		 NVARCHAR(50),
	CategoryID 		 INT,
	TypeID  		 INT,
	CreatorID		 INT,
	CreateDate		 DATE
);

-- Tạo bảng 9 : Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE  Answer(
	AnswerID	 	 INT,
	Content	 		 NVARCHAR(100),
	QuestionID 		 INT,
	isCorrect		 INT
);

-- Tạo bảng 10 : Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE  Exam(
	ExamID	 	 	INT,
	`Code`	 	 	NVARCHAR(50),
	Tilte 			NVARCHAR(50),
	CategoryID  	INT,
	Duration		INT,
	CreatorID  		INT,
	CreateDate		DATE
);

-- Tạo Bảng 11 : ExamQuestion
CREATE TABLE  ExamQuestion(
	ExamID	 	   INT ,
	QuestionID	   INT 
);