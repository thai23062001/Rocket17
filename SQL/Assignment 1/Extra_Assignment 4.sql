DROP DATABASE IF EXISTS TestingSystem1;
CREATE DATABASE TestingSystem1;
use TestingSystem1;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	Department_Number 	TINYINT UNIQUE AUTO_INCREMENT PRIMARY KEY,
	Department_Name		 VARCHAR(25) UNIQUE KEY NOT NULL
);

DROP TABLE IF EXISTS Employee_Table;
CREATE TABLE Employee_Table(
	Employee_Number 	TINYINT UNIQUE AUTO_INCREMENT PRIMARY KEY,
	Employee_Name		VARCHAR(25) UNIQUE KEY NOT NULL,
    Department_Number 	TINYINT UNIQUE NOT NULL,
    FOREIGN KEY (Department_Number) REFERENCES Department(Department_Number)
);

DROP TABLE IF EXISTS Employee_Skill_Table;
CREATE TABLE Employee_Skill_Table(
	Employee_Number 	TINYINT UNIQUE,
	Skill_Code  		VARCHAR(25) NOT NULL,
    Date_Registered		DATETIME DEFAULT NOW(),
    FOREIGN KEY (Employee_Number) REFERENCES Employee_Table(Employee_Number)
);


INSERT INTO Department( Department_Name )
VALUE				  (N'Marketing'		),					
					  (N'Sale'			),
					  (N'Bảo vệ'		),
					  (N'Nhân Sự'		),
					  (N'Kỹ Thuật'		),
					  (N'Tài Chính'		),
					  (N'Phó Giám Đốc'	),
					  (N'Giám Đốc'		),
					  (N'Thư Kí'		),
					  (N'Bán Hàng'		);
                      
INSERT INTO Employee_Table( Employee_Name		, Department_Number	)
VALUE						('Nguyen Ba N '		,		2			),
							('Nguyen Van A '	,		9			),
                            ('Ngo Anh M '		,		6			),
                            ('Cat Van Thuc '	,		10			),
                            ('Nguyen Ba P '		,		8			),
                            ('Tran Quoc T '		,		7			),
                            ('Nguyen Ba V '		,		5			),
                            ('Nguyen Ngoc K '	,		4			),
                            ('Tran Danh T '		,		1			),
                            ('Hoang Duc H '		,		3			);
                            
INSERT INTO Employee_Skill_Table( Employee_Number	, Skill_Code	,Date_Registered	)
VALUE							(1					, 'Java'		,'2021-07-23'		),
								(2					, 'Ruby'		,'2021-07-19'		),
                                (3					, 'C'			,'2021-07-22'		),
                                (4					, 'Python'		,'2021-07-23'		),
                                (5					, 'ASP.NET'		,'2021-07-24'		),
                                (6					, 'ADO.NET'		,'2021-07-20'		),
                                (7					, 'Java'			,'2021-07-21'		),
                                (8					, 'PHP'			,'2021-07-17'		),
                                (9					, 'C++'			,'2021-07-24'		),
                                (10					, 'Postman'		,'2021-07-22'		);
                                
SELECT ET.Employee_Name
FROM Employee_Table ET
JOIN Employee_Skill_Table ES ON ET.Employee_Number = ES.Employee_Number
WHERE ES.Skill_Code = 'Java';      

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên                
SELECT *, COUNT(ET.Department_Number)
FROM Employee_Table ET
JOIN Department D ON ET.Department_Number = D.Department_Number
GROUP BY ET.Department_Number
HAVING COUNT(ET.Department_Number) >3;

-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.
SELECT *
FROM Employee_Table ET
JOIN Department D ON ET.Department_Number = D.Department_Number
GROUP BY ET.Department_Number;

-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.
SELECT *, COUNT(EST.Skill_Code)
FROM Employee_Table ET
JOIN Employee_Skill_Table EST ON ET.Employee_Number = EST.Employee_Number
GROUP BY EST.Skill_Code
HAVING COUNT(EST.Skill_Code) >1;