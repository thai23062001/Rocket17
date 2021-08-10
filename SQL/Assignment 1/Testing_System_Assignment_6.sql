-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
DROP PROCEDURE IF EXISTS departmental_accounts;
DELIMITER $$
	CREATE PROCEDURE departmental_accounts (IN dpName VARCHAR(50))
		BEGIN
			SELECT *
			FROM `Account` AS A
			JOIN Department AS D ON A.DepartmentID = D.DepartmentID
			WHERE D.DepartmentName = dpName;
		END $$
DELIMITER ;

CALL departmental_accounts('Sale');
-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS number_of_accounts ;
DELIMITER $$
	CREATE PROCEDURE number_of_accounts (IN tennhom VARCHAR(50) )
		BEGIN
			SELECT GA.GroupID, COUNT(GA.AccountID)
			FROM GroupAccount AS GA
			JOIN `Group` AS G ON GA.GroupID = G.GroupID
            WHERE G.GroupName = tennhom
            GROUP BY G.GroupID;
		END $$
DELIMITER ;

CALL number_of_accounts ('nhom2');

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại current month
DROP PROCEDURE IF EXISTS current_month ;
DELIMITER $$
CREATE PROCEDURE current_month()
BEGIN
		SELECT COUNT(TypeID)
		FROM Question 
		WHERE month(CreateDate) = month(now());
END $$
DELIMITER ;
 CALL current_month();
 
 -- Question 4:Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS the_most_questions ;
DELIMITER $$
CREATE PROCEDURE the_most_questions()
BEGIN
 WITH sl_question AS(
	 SELECT COUNT(TypeID) AS so_luong
	 FROM Question
	 GROUP BY TypeID
 ),
 max_sl AS(
	 SELECT MAX(so_luong)
	 FROM sl_question
 )
 SELECT *
 FROM Question AS Q
 JOIN TypeQuestion AS TQ ON Q.TypeID=TQ.TypeID
 GROUP BY TQ.TypeID
 HAVING COUNT(TQ.TypeID) = (SELECT *
							FROM max_sl);
END $$
DELIMITER ;

CALL the_most_questions();

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
 DROP PROCEDURE IF EXISTS the_most_questions ;
DELIMITER $$
CREATE PROCEDURE the_most_questions()
	BEGIN
	 WITH sl_question AS(
		 SELECT COUNT(TypeID) AS so_luong
		 FROM Question
		 GROUP BY TypeID
	 ),
	 max_sl AS(
		 SELECT MAX(so_luong)
		 FROM sl_question
	 )
	 SELECT TQ.TypeName
	 FROM Question AS Q
	 JOIN TypeQuestion AS TQ ON Q.TypeID=TQ.TypeID
	 GROUP BY TQ.TypeID
	 HAVING COUNT(TQ.TypeID) = (SELECT *
								FROM max_sl);
	END $$
DELIMITER ;

CALL the_most_questions();

-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên 
 -- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa 
 -- chuỗi của người dùng nhập vào
DROP PROCEDURE IF EXISTS sp_Name ;
DELIMITER $$
CREATE PROCEDURE st_Name(IN string_of_Name VARCHAR(50))
	BEGIN
		SELECT GroupName
		FROM `Group`
		WHERE GroupName LIKE CONCAT("%",string_of_Name,"%")
		UNION 
		SELECT Username
		FROM `Account` 
		WHERE Username LIKE CONCAT("%",string_of_Name,"%");

	END $$
DELIMITER ;

CALL sp_Name('t');

-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ tự động gán:
-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ
 -- Sau đó in ra kết quả tạo thành công
 
-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
-- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất

-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
DROP PROCEDURE IF EXISTS st_delete_id;
DELIMITER $$
CREATE PROCEDURE st_delete_id (IN Ex_id SMALLINT UNSIGNED)
	BEGIN
		DELETE
		FROM Exam
		WHERE ExamID= Ex_id;
	END $$
DELIMITER ;
-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi, sau đó in số lượng record đã remove từ các table liên quan
-- trong khi removing
 DROP PROCEDURE IF EXISTS st_delete_exam;
DELIMITER $$
CREATE PROCEDURE st_delete_exam ()
BEGIN 
	WITH exams_created_3year AS (
		SELECT *
        FROM Exam
        WHERE YEAR(CreateDate) =YEAR(now()) - 3
    )
	DELETE
    FROM Exam
    WHERE ExamID = (SELECT * FROM exams_created_3year);

END $$
DELIMITER ;
CALL st_delete_exam ();
-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
-- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được chuyển về phòng
-- ban default là phòng ban chờ việc
 DROP PROCEDURE IF EXISTS st_delete_departments;
DELIMITER $$
CREATE PROCEDURE st_delete_departments (IN dpName VARCHAR(50))
BEGIN 
		UPDATE `Account`
		SET DepartmentID = 10
		WHERE DepartmentID = (SELECT DepartmentID
								FROM Department
                                WHERE DepartmentName= dpName);
        DELETE 
		FROM Department
	    WHERE DepartmentName= dpName;
END $$
DELIMITER ;
-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay
 DROP PROCEDURE IF EXISTS st_questionsInMonth;
DELIMITER $$
CREATE PROCEDURE st_questionsInMonth ()
	BEGIN 
		SELECT *,COUNT(QuestionID) AS Count_Q
		FROM Question
		WHERE YEAR(CreateDate)=YEAR(NOW())
		GROUP BY MONTH(CreateDate);
	END $$
DELIMITER ;
CALL st_questionsInMonth();


-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6
-- tháng gần đây nhất (nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào
-- trong tháng")