-- Question 1:
SELECT `Name`
FROM product 
WHERE ProductSubcategoryID = (SELECT ProductSubcategoryID
								FROM productsubcategory
								Where `Name` ='Saddles');

-- Question 2:
SELECT `Name`
FROM product 
Where ProductSubcategoryID IN (SELECT ProductSubcategoryID
								FROM productsubcategory
								Where `Name` Like'Bo%');
                                
-- Question 3:
SELECT `Name`
FROM product
WHERE ListPrice = (SELECT MIN(ListPrice)
					FROM product
                    WHERE ProductSubcategoryID =3);
                    
-- Exercise 2: JOIN nhiều bảng
-- Question1
	SELECT c.`name`,s.`name`
	FROM countryregion c
	JOIN stateprovince s ON C.CountryRegionCode= s.CountryRegionCode;

-- Question2
	SELECT c.`name`,s.`name`
	FROM countryregion c
	JOIN stateprovince s ON C.CountryRegionCode= s.CountryRegionCode
	WHERE c.`name` = 'Germany' OR c.`name`='Canada';

-- Question3
	SELECT sd.SalesOrderID,sd.OrderDate,sp.SalesPersonID,sp.Bonus,sp.SalesYTD
	FROM salesperson sp
	JOIN salesorderheader sd ON sp.SalesPersonID = sd.SalesPersonID
    LIMIT 4000;

---- Question4
	SELECT sd.SalesOrderID,sd.OrderDate , e.Title, sp.Bonus,sp.SalesYTD
	FROM salesorderheader sd
	JOIN salesperson sp ON sp.SalesPersonID = sd.SalesPersonID
	JOIN employee e ON sd.SalesPersonID = e.EmployeeID
	LIMIT 4000;