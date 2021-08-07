-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
DROP VIEW IF EXISTS lis_ofs_taff_in_sales;
CREATE VIEW lis_ofs_taff_in_sales AS
	SELECT a.AccountID,a.Email,a.fullName
	FROM testingsystem.Department d
	JOIN `Account`a  ON d.DepartmentID = a.DepartmentID
	WHERE d.DepartmentID =  (SELECT d1.DepartmentID
							FROM Department d1
                            WHERE d1.DepartmentName = 'sale') ;
SELECT *
FROM lis_ofs_taff_in_sales;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
DROP VIEW IF EXISTS information_about_accounts;
CREATE VIEW information_about_accounts AS
	SELECT A.Email,A.fullName,A.DepartmentID,A.AccountID, COUNT(A.AccountID)
    FROM `Account` A
    JOIN GroupAccount GA ON A.AccountID = GA.AccountID
    GROUP BY  A.AccountID
    HAVING COUNT( A.AccountID) = (SELECT MAX(Number1_count)
								  FROM (SELECT COUNT( AccountID) AS Number1_count
										FROM GroupAccount 
                                        GROUP BY AccountID) AS temp );
SELECT 	*
FROM 	information_about_accounts	;			

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
DROP VIEW IF EXISTS long_content ;
CREATE VIEW long_content AS
SELECT *
FROM Question 
WHERE length(Content) > 22;

DELETE
FROM long_content ;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
DROP VIEW IF EXISTS list_of_departments ;
CREATE VIEW list_of_departments AS
	SELECT A.Email,A.fullName,D.DepartmentName, COUNT(D.DepartmentID)
    FROM `Account` A
    JOIN Department D ON A.DepartmentID = D.DepartmentID
    GROUP BY  D.DepartmentID
    HAVING COUNT( D.DepartmentID) = (SELECT MAX(the_most_employees)
								  FROM (SELECT COUNT( DepartmentID) AS the_most_employees
										FROM Department 
                                        GROUP BY DepartmentID) AS temp );
SELECT *
FROM list_of_departments;

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
DROP VIEW IF EXISTS all_questions_included ;
CREATE VIEW all_questions_included AS
SELECT  A.fullName, Q.Content,Q.QuestionID,Q.CreatorID
FROM `Account`A
JOIN Question Q ON A.AccountID = Q.CreatorID  
WHERE  Q.CreatorID IN (SELECT AccountID
						FROM `Account`
                        WHERE fullName LIKE 'Nguyen%');          
SELECT *
FROM all_questions_included;
