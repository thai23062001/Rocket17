                            -- Exercise 1: Join
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT *
FROM `Account` A
JOIN Department D ON A.DepartmentID = D.DepartmentID;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT *
FROM `Account`
WHERE CreateDate < '2021-12-20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT *
FROM `Account`A
JOIN `Position`P ON A.PositionID = P.PositionID
WHERE P.PositionName = 'Dev' ;

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT D.DepartmentName , COUNT(A.DepartmentID)
FROM `Account`A
JOIN Department D ON A.DepartmentID = D.DepartmentID
HAVING COUNT(A.DepartmentID) >3 ;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT Q.QuestionID, Q.Content
FROM Question Q
JOIN ExamQuestion E ON Q.QuestionID = E.QuestionID
GROUP BY E.QuestionID
HAVING COUNT(E.QuestionID) = (SELECT MAX(number_of_questions) 
							  FROM (SELECT COUNT(E.QuestionID) AS number_of_questions
								    FROM ExamQuestion E
                                    GROUP BY E.QuestionID ) AS temp);
                                    
                                 
-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT C.CategoryID, COUNT(Q.CategoryID)
FROM  CategoryQuestion C
JOIN Question Q  ON C.CategoryID = Q.CategoryID
GROUP BY C.CategoryID;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT * , COUNT(Q.QuestionID)
FROM ExamQuestion EQ
RIGHT JOIN Question Q ON EQ.QuestionID = Q.QuestionID
GROUP BY EQ.QuestionID;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT A.QuestionID, A.Content 
FROM Answer A
JOIN Question Q ON A.QuestionID = Q.QuestionID
GROUP BY Q.QuestionID
HAVING COUNT(Q.QuestionID) = (SELECT MAX(Number_Questions)
							  FROM (SELECT COUNT(Q.QuestionID) AS Number_Questions
									FROM Question Q
                                    GROUP BY Q.QuestionID) AS nhom );

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT GA.GroupID, COUNT(A.AccountID)
FROM GroupAccount GA
JOIN `Account` A ON GA.AccountID = A.AccountID
GROUP BY GA.AccountID;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT P.PositionID,P.PositionName, COUNT(1)
FROM `Position`P
JOIN `Account`A ON P.PositionID = A.PositionID
GROUP BY A.PositionID
HAVING COUNT(A.PositionID) = (SELECT MIN(Number_Position)
							  FROM (SELECT COUNT(A.PositionID) AS Number_Position
									FROM `Account`A
                                    GROUP BY A.PositionID) AS temp );

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT *, COUNT( D.DepartmentID)
FROM `Account`AC
JOIN Department D ON AC.DepartmentID = D.DepartmentID
JOIN `Position`P ON P.PositionID = AC.PositionID
GROUP BY AC.DepartmentID, AC.PositionID ;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …
SELECT *
FROM Question Q
JOIN `Answer` A ON Q.QuestionID = A.QuestionID
JOIN TypeQuestion T ON Q.TypeID = T.TypeID
JOIN CategoryQuestion C ON Q.CategoryID = C.CategoryID 
JOIN `Account` AC ON Q.CreatorID = AC.AccountID;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT *,  COUNT(1)
FROM TypeQuestion T
JOIN Question Q ON T.TypeID = Q.TypeID
GROUP BY T.TypeID;

-- Question 14:Lấy ra group không có account nào
SELECT *
FROM `Group` G 
LEFT JOIN GroupAccount GA ON G.GroupID = GA.GroupID
WHERE GA.GroupID IS NULL;

-- Question 15: Lấy ra account  không có group nào
SELECT *
FROM  `Account` A
RIGHT JOIN GroupAccount GA  ON G.AccountID = GA.AccountID
WHERE GA.AccountID IS NULL;

-- Question 16: Lấy ra question không có answer nào
SELECT *
FROM Question Q
LEFT JOIN Answer A ON Q.QuestionID = A.QuestionID
WHERE A.QuestionID IS NULL;
 
						-- Exercise 2: Union
			-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
SELECT *
FROM `Account`A
JOIN GroupAccount GA ON A.AccountID = GA.AccountID
WHERE GA.AccountID = 1;

-- b) Lấy các account thuộc nhóm thứ 2
SELECT *
FROM `Account`A
JOIN GroupAccount GA ON A.AccountID = GA.AccountID
WHERE GA.AccountID = 2;

-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT *
FROM `Account`A
JOIN GroupAccount GA ON A.AccountID = GA.AccountID
WHERE GA.AccountID = 1

UNION

SELECT *
FROM `Account`A
JOIN GroupAccount GA ON A.AccountID = GA.AccountID
WHERE GA.AccountID = 2;

			-- Question 18:
-- a) Lấy các group có lớn hơn 5 thành viên
SELECT G.GroupName, COUNT(G.GroupID)
FROM `Group`G
JOIN GroupAccount GA ON G.GroupID=GA.GroupID
GROUP BY G.GroupID
HAVING COUNT(G.GroupID) >5;

-- b) Lấy các group có nhỏ hơn 7 thành viên
SELECT G.GroupName, COUNT(G.GroupID)
FROM `Group`G
JOIN GroupAccount GA ON G.GroupID=GA.GroupID
GROUP BY G.GroupID
HAVING COUNT(G.GroupID) <7;

-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT G.GroupName, COUNT(G.GroupID)
FROM `Group`G
JOIN GroupAccount GA ON G.GroupID=GA.GroupID
GROUP BY G.GroupID
HAVING COUNT(G.GroupID) >5

UNION ALL

SELECT G.GroupName, COUNT(G.GroupID)
FROM `Group`G
JOIN GroupAccount GA ON G.GroupID=GA.GroupID
GROUP BY G.GroupID
HAVING COUNT(G.GroupID) <7;