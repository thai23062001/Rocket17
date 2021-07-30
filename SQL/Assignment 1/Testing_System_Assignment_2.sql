DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;
use TestingSystem;

-- Tạo bảng 1 : Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	DepartmentID 	 	 TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	DepartmentName		 NVARCHAR(25) UNIQUE KEY NOT NULL
);

-- Tạo Bảng 2 : Position
DROP TABLE IF EXISTS `Position`;
CREATE TABLE  `Position`(
	PositionID	 	 	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	PositionName	 	ENUM('Dev', 'Test', 'Scrum Master', 'PM') UNIQUE KEY NOT NULL
);

-- Tạo Bảng 3 : Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE  `Account`(
	AccountID	 		SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Email	 			NVARCHAR(50) UNIQUE KEY NOT NULL,
	Username 			NVARCHAR(50) UNIQUE KEY NOT NULL,
	fullName  			NVARCHAR(50) NOT NULL,
	DepartmentID    	TINYINT UNSIGNED NOT NULL,
	PositionID 			TINYINT UNSIGNED NOT NULL,
	CreateDate			DATETIME DEFAULT NOW(),
    FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID), 
    FOREIGN KEY (PositionID) REFERENCES `Position` (PositionID) 
);

-- Tạo bảng 4 : Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE  `Group`(
	GroupID	 	 	   TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
	GroupName		   NVARCHAR(50) UNIQUE KEY NOT NULL,
	CreatorID	 	   SMALLINT UNSIGNED ,
	CreateDate		   DATETIME DEFAULT NOW()
);

-- Tạo bảng 5 : GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE  GroupAccount(
	GroupID	 	       TINYINT UNSIGNED ,
	AccountID	 	   SMALLINT UNSIGNED NOT NULL,
	JoinDate	   	   DATETIME DEFAULT NOW(),
    PRIMARY KEY (GroupID, AccountID),
    FOREIGN KEY (GroupID) REFERENCES `Group` (GroupID),
    FOREIGN KEY (AccountID) REFERENCES `Account` (AccountID)
);

-- Tạo Bảng 6 TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
	TypeID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	TypeName 		ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);

-- Tạo Bảng 7 : CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE  CategoryQuestion(
	CategoryID	 	  TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	CategoryName	  NVARCHAR(50) UNIQUE KEY NOT NULL 
);

-- Tạo bảng 8 : Question
DROP TABLE IF EXISTS Question;
CREATE TABLE  Question(
	QuestionID	 	 SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Content	 		 NVARCHAR(50)  NOT NULL,
	CategoryID 		 TINYINT UNSIGNED NOT NULL,
	TypeID  		 TINYINT UNSIGNED NOT NULL,
	CreatorID		 SMALLINT UNSIGNED NOT NULL,
	CreateDate		 DATETIME DEFAULT NOW(),
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion (TypeID),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID),
    FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID)
);

-- Tạo bảng 9 : Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE  Answer(
	AnswerID	 	 SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Content	 		 NVARCHAR(100) NOT NULL,
	QuestionID 		 SMALLINT UNSIGNED NOT NULL,
	isCorrect		 BIT DEFAULT 1,
    FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);

-- Tạo bảng 10 : Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE  Exam(
	ExamID	 	 	SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`Code`	 	 	NVARCHAR(50)  NOT NULL,
	Tilte 			NVARCHAR(50) NOT NULL,
	CategoryID  	TINYINT UNSIGNED NOT NULL,
	Duration		TINYINT UNSIGNED NOT NULL,
	CreatorID  		SMALLINT UNSIGNED NOT NULL,
	CreateDate		DATETIME DEFAULT NOW(),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);

-- Tạo Bảng 11 : ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE  ExamQuestion(
	ExamID	 	   SMALLINT UNSIGNED NOT NULL,
	QuestionID	   SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID),
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
	PRIMARY KEY (ExamID, QuestionID)
);

		                                -- Thêm dữ liệu vào Bảng --
-- Thêm dữ liệu vào bảng 1 :
INSERT INTO Department( DepartmentName)
VALUE                   (N'Marketing'	),					
						(N'Sale'		),
                        (N'Bảo vệ'		),
                        (N'Nhân Sự'		),
			            (N'Kỹ Thuật'	),
                        (N'Tài Chính'	),
                        (N'Phó Giám Đốc'),
                        (N'Giám Đốc'	),
                        (N'Thư Kí'		),
                        (N'Bán Hàng'	);
                        
-- Thêm dữ liệu bảng 2 :
INSERT INTO `Position`( PositionName)
VALUE 				  ( 'DEV'        	),
					  ( 'Test'        	),
                      ( 'Scrum Master'   ),
                      ( 'PM'      		);
                      
-- Thêm dữ liệu bảng 3 :
INSERT INTO  `Account`(   Email,             Username,           FullName,        DepartmentID,   PositionID,     CreateDate)
VALUE				 ( 'thai23@gmail.com', 	'thai1', 		'Tran Danh Thai'   , 			10,			 1,			' 2021-2-3'),																					
					 (	 'minh2@gmail.com' ,     'minh2',     'Tran Van Minh'	,         	2 ,          2,         '2021-07-15'),	
                     (	 'dung5@gmail.com' ,     'dung',    'Trinh Thi Thuy Dung',        	3,          3,         '2021-07-16'),	
                     (	 'hai4@gmail.com' ,      'hai2',       'Nguyen Hai'	,          		1 ,         3,         '2021-07-14'),	
                     (	 'quan5@gmail.com' ,     'quan4',     'Nguyen Anh Quan',       		7 ,          4,         '2021-07-17'),	
                     (	 'son6@gmail.com' ,      'son109',      'Nguyen van Son',        	5 ,          3,         '2021-07-18'),	
                     (	 'huy7@gmail.com' ,     'huy200',     'Tran Danh Huy',        		8 ,          2,         '2021-07-19'),	
                     (	 'linh8@gmail.com' ,     'linh445',     'Như Thuy Linh'	,         	9 ,          1,         '2021-07-20'),	
                     (	 'long9@gmail.com' ,     'long236',     'Le Văn Long'	,           4 ,          2,         '2021-07-15'),	
                     (	 'mai45@gmail.com' ,    'mai111',      'Tran Thi Mai'	,          	6 ,          1,         '2021-07-16');
                     
-- Thêm dữ liệu bảng 4 :
INSERT INTO `Group`(    GroupName,             CreatorID,          CreateDate  )
VALUE	         (    'nhom1'         ,         1          ,    ' 2021-07-16'             ),
				 (    'nhom2'        ,          2          ,    ' 2021-07-17'             ),
                 (     'nhom3'        ,          3          ,     ' 2021-07-16'            ),
                 (    'nhom4'         ,         4          ,      ' 2021-07-15'           ),
                 (     'nhom5'        ,          5          ,     ' 2021-07-14'            ),
                 (     'nhom6'         ,         6          ,     ' 2021-07-16'            ),
                 (     'nhom7'         ,         7          ,    ' 2021-07-18'             ),
                 (     'nhom8'         ,         8          ,    ' 2021-07-17'             ),
                 (     'nhom9'        ,          9          ,     ' 2021-07-16'            ),
                 (    'nhom10'         ,        10         ,      ' 2021-07-15'           );
                 
-- Thêm dữ liệu bảng 5 :
INSERT INTO GroupAccount(GroupID,     AccountID,             JoinDate     )
VALUE	         (1      ,             1          ,    ' 2021-07-16'      ),
				 (2      ,             2          ,    ' 2021-07-17'      ),
                 (3      ,             3         ,     ' 2021-07-16'      ),
                 (4      ,             4          ,      ' 2021-07-15'    ),
                 (5      ,             5          ,     ' 2021-07-14'     ),
                 (6      ,             6          ,     ' 2021-07-16'     ),
                 (7      ,             7          ,    ' 2021-07-18'      ),
                 (8      ,             8          ,    ' 2021-07-17'      ),
                 (9      ,             9          ,     ' 2021-07-16'     ),
                 (10      ,            10         ,      ' 2021-07-15'    );
		
-- Thêm dữ liệu bảng 6 :
INSERT INTO TypeQuestion (TypeName 			)
VALUES                   ('Essay' 			),
                         ('Multiple-Choice' );
                        
-- Thêm dữ liệu bảng 7 :
INSERT INTO CategoryQuestion(     CategoryName  )
VALUE                       (       'Java'	  ),
							(        'ASP.NET'  ),
							(        'SQL' 	  ),
							(        'Postman'  ),
							(        'Ruby'	  ),
							(        'Python'   ),
							(        'C++'      ),
							(        'C'        ),
							(        'PHP'      ),
							(        'ADO.NET' );
                            
-- Thêm dữ liệu bảng 8 :
INSERT INTO Question(     Content            , CategoryID,TypeID,CreatorID,  CreateDate  )
VALUE               ( N'Câu hỏi về C++'  	, 	2		, 	1	, 	 2	,	'2021-07-16'),
                    ( N'Câu hỏi về PHP'  	, 	3		, 	2	,	 4	,	'2021-07-14'),
                    ( N'Câu hỏi về C'		,  	5		,	2	,	 3	,	'2021-07-16'),
                    ( N'Câu hỏi về Ruby' 	, 	1		, 	1	,	 5	,	'2021-07-27'),
                    ( N'Câu hỏi về ADO.NET' , 	6		,	2	, 	 7	,	'2021-07-20'),
                    ( N'Câu hỏi về Python' 	, 	8		, 	1	,	 10	,	'2021-07-18'),
                    ( N'Câu hỏi về SQL' 	, 	10		, 	2	,	 6	,	'2021-07-15'),
                    ( N'Câu hỏi về ASP.NET' , 	4		, 	2	,	 1	,	'2021-07-16'),
                    ( N'Câu hỏi về Postman' , 	7		, 	1	,	 9	,	'2021-07-17'),
                    ( N'Câu hỏi về Java' 	, 	9		, 	2	,	 8	,	'2021-07-14'); 
                    
-- Thêm dữ liệu bảng 9 :
INSERT INTO `Answer`(     Content    , QuestionID   ,    isCorrect 	)
VALUE 			  ( N'Trả lời 01'  ,	1		   ,      	1		),
				  ( N'Trả lời 02'  ,	3		   ,      	0		),
                  ( N'Trả lời 03'  ,	4		   ,        1		),
                  ( N'Trả lời 04'  ,	6		   ,        1		),
				  ( N'Trả lời 05'  ,	2		   , 		0		),
                  ( N'Trả lời 06'  ,	5		   , 		0		),
                  ( N'Trả lời 07'  ,	10		   , 		0		),
                  ( N'Trả lời 08'  ,	9		   , 		1		),
                  ( N'Trả lời 09'  ,	8		   , 		0		),
                  ( N'Trả lời 10'  ,	7		   , 		1		);
                  
-- Thêm dữ liệu bảng 10 :
INSERT INTO Exam(  `Code`     ,      Tilte                    , CategoryID   ,   Duration , CreatorID  ,   CreateDate 	)
VALUES 			('VTIQ001'   , N'Câu hỏi về C++'  			, 	2			, 	60		, 	 2		,	'2021-07-16'	),
				( 'VTIQ002'   , N'Câu hỏi về PHP'  			, 	3			, 	60		,	 4		,	'2021-07-14'	),
				( 'VTIQ003'   , N'Câu hỏi về C'		   		,  	5			,	60		,	 3		,	'2021-07-16'	),
				( 'VTIQ004'   , N'Câu hỏi về Ruby' 			, 	1			, 	60		,	 5		,	'2021-07-27'	),
				( 'VTIQ005'   , N'Câu hỏi về ADO.NET' 		, 	6			,	120		, 	 7		,	'2021-07-20'	),
				( 'VTIQ006'   , N'Câu hỏi về Python' 		, 	8			, 	120		,	 10		,	'2021-07-18'	),
				( 'VTIQ007'   , N'Câu hỏi về SQL' 			, 	10			, 	60		,	 6		,	'2021-07-15'	),
				( 'VTIQ008'   , N'Câu hỏi về ASP.NET' 		, 	4			, 	120		,	 1		,	'2021-07-16'	),
				( 'VTIQ009'   , N'Câu hỏi về Postman' 		, 	7			, 	60		,	 9		,	'2021-07-17'	),
				( 'VTIQ010'   , N'Câu hỏi về Java' 			, 	9			, 	60		,	 8		,	'2021-07-14)'	);
                
                
-- Thêm dữ liệu bảng 11 :
INSERT INTO ExamQuestion(ExamID,     QuestionID   )
VALUES  				( 1    ,     1            ),
						( 2    ,     2            ),
                        ( 3    ,     3            ),
                        ( 4    ,     4            ),
                        ( 5    ,     5            ),
                        ( 6    ,     6            ),
                        ( 7    ,     7            ),
                        ( 8    ,     8            ),
                        ( 9    ,     9            ),
                        ( 10    ,    10           );
	
