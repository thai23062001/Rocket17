DROP DATABASE IF EXISTS TestingSystem1;
CREATE DATABASE TestingSystem1;
use TestingSystem1;

DROP TABLE IF EXISTS Trainee3;
CREATE TABLE Trainee3(
		TraineeID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
		Full_Name 			VARCHAR(20) NOT NULL UNIQUE KEY,
		Birth_Date 			DATETIME NOT NULL,
		Gender 				ENUM('male','female','unknown')NOT NULL,
        ET_IQ 				TINYINT UNSIGNED  NOT NULL CHECK(ET_IQ <= 20),
		ET_Gmath 			TINYINT UNSIGNED  NOT NULL CHECK(ET_Gmath <= 20),
        ET_English 			TINYINT UNSIGNED  NOT NULL CHECK(ET_English <= 50),
		Training_Class 		VARCHAR(25) NOT NULL,
        Evaluation_Notes	VARCHAR(50)  NULL
);


INSERT INTO Trainee3(Full_Name		,	Birth_Date		,	Gender		,	ET_IQ		,ET_Gmath	,ET_English	,Training_Class		,Evaluation_Notes)
VALUE 				('Tran Van A'	, ' 2001-06-01 '	,  'female'		,	10			, 	15		,	25		,	'VTI001'		,'NULL'),
					('Nguyen Van B'	, '2001-06-01'		,  'male'		, 	15			,	20		,   35		,	'VTI002'		,'NULL'),
                    ('Le Van C'		, '2001-03-12'		,  'female'		, 	8			,	16		,   26		,	'VTI003'		,'NULL'),
                    ('Nguyen Van C'	, '2001-06-20'		,  'male'		, 	4			,	9		,   40		,	'VTI004'		,'NULL'),
                    ('Nguyen Ba D'	, '2001-02-19'		,  'unknown'	, 	20			,	8		,   25		,	'VTI001'		,'NULL'),
                    ('Ngo Anh M'	, '2001-01-15'		,  'female'		, 	18			,	12		,   45		,	'VTI002'		,'NULL'),
                    ('Nguyen DUY A'	, '2001-01-30'		,  'male'		, 	14			,	14		,   50		,	'VTI001'		,'NULL'),
                    ('Ha Van B'		, '2001-04-05'		,  'male'		, 	17			,	20		,   25		,	'VTI002'		,'NULL'),
                    ('Tran Thi C'	, '2001-05-06'		,  'female'		, 	18			,	10		,   15		,	'VTI004'		,'NULL'),
                    ('Nguyen NGoc B', '2001-12-01'		,  'unknown'	, 	20			,	20		,   45		,	'VTI003'		,'NULL');

SELECT *
FROM Trainee3;

-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, nhóm chúng thành các tháng sinh khác nhau
SELECT *, COUNT(1)
FROM Trainee3
GROUP BY Birth_Date;

-- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau: tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)
SELECT *
FROM Trainee3
WHERE LENGTH(Full_Name) = (SELECT MAX(LENGTH(Full_Name)) FROM Trainee3);

-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET
SELECT *
FROM Trainee3
WHERE ET_IQ + ET_Gmath>=20 AND ET_IQ>=8 AND ET_Gmath>=8 AND ET_English>=18;

-- Question 5: xóa thực tập sinh có TraineeID = 3
DELETE 
FROM Trainee3
WHERE TraineeID = 3;

-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật thông tin vào database
UPDATE Trainee3
SET Training_Class = 'VIT002'
WHERE TraineeID = 5;
