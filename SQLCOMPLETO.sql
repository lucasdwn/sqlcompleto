SELECT * 
FROM person.Person;

SELECT Title
FROM person.Person;

SELECT * 
FROM person.EmailAddress;

SELECT DISTINCT LastName
FROM person.Person;

/* WHERE */

SELECT *
FROM person.person
WHERE lastName = 'miller' and FirstName = 'anna';

SELECT * 
FROM Production.Product
WHERE color <> 'red'

SELECT name 
FROM Production.Product
WHERE Weight > 500 and Weight < 700;

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'm' and SalariedFlag = 'true';

SELECT * 
FROM Person.Person
WHERE FirstName = 'peter' and LastName = 'krebs';

SELECT *
FROM Person.EmailAddress
WHERE BusinessEntityID = 26;

/* COUNT */

SELECT count(DISTINCT title)
FROM Person.Person;

SELECT count (*)
FROM Production.Product;

SELECT count(size)
FROM Production.Product;

SELECT count(DISTINCT size)
FROM Production.Product;

/* TOP E ORDER BY */

SELECT TOP 10 * 
FROM Production.Product;

SELECT  FirstName, LastName 
FROM Person.Person
ORDER BY FirstName asc, LastName desc;

SELECT LastName
FROM Person.Person
ORDER BY MiddleName asc;

SELECT TOP 10 ProductID, ListPrice
FROM Production.Product
ORDER BY ListPrice desc;

SELECT TOP 4 Name, ProductNumber
FROM Production.Product
Order By ProductID asc;

/* BETWEEN */

SELECT *
FROM Production.Product
WHERE ListPrice NOT BETWEEN 1000 and 1500;

SELECT *
FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009/01/01' and '2010/01/01'
ORDER BY HireDate;

/* IN */
SELECT *
FROM Person.Person
WHERE BusinessEntityID IN(2,7,13);

/* LIKE */

SELECT * 
FROM Person.Person
WHERE FirstName like 'ovi%';

SELECT *
FROM Person.Person
WHERE FirstName like '%to';

SELECT * 
FROM Person.Person
WHERE FirstName like '%essa%';

SELECT COUNT(*)
FROM Production.Product
WHERE ListPrice > 1500;

SELECT COUNT(*)
FROM Person.Person
WHERE LastName like 'p%';

SELECT COUNT(DISTINCT CITY)
FROM Person.Address;

SELECT DISTINCT city
FROM Person.Address;

SELECT COUNT(*)
FROM Production.Product
WHERE Color = 'red' and ListPrice BETWEEN 500 AND 1000;

SELECT COUNT(*)
FROM Production.Product
WHERE name like '%road%';

/* MIN MAX SUM AVG */

SELECT TOP 10 sum(linetotal) AS "SOMA"
FROM Sales.SalesOrderDetail;

SELECT TOP 10 MIN(linetotal) AS "MENOR"
FROM Sales.SalesOrderDetail;

SELECT TOP 10 AVG(linetotal) AS "MEDIA"
FROM Sales.SalesOrderDetail;

/* GROUP BY */

SELECT * 
FROM Sales.SalesOrderDetail

SELECT SpecialOfferId, SUM(UnitPrice) AS "SOMA"
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID;

SELECT SpecialOfferId, UnitPrice
FROM Sales.SalesOrderDetail
WHERE SpecialOfferID = 9;

SELECT ProductID, COUNT(productId) as "CONTAGEM"
FROM SALES.SalesOrderDetail
GROUP BY ProductID;

SELECT FirstName, COUNT(FirstName) AS "CONTAGEM"
FROM Person.Person
GROUP BY FirstName;

SELECT color, AVG(ListPrice) AS "MEDIA"
FROM Production.Product
WHERE color = 'silver'
GROUP BY color;

SELECT middleName, COUNT(middleName) AS "CONTAGEM"
FROM Person.Person
GROUP BY MiddleName;

SELECT ProductID, AVG(OrderQty) AS "MEDIA"
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

SELECT TOP 10 ProductID, SUM(linetotal) AS "TOTAL"
FROM sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(linetotal) DESC;

SELECT ProductId, COUNT(ProductId) AS "CONTAGEM", 
AVG(OrderQty) AS "MEDIA"
FROM Production.WorkOrder
GROUP BY ProductID;

/* HAVING */

SELECT FirstName, COUNT(FirstName) AS "QUANTIDADE"
FROM Person.Person
GROUP BY FirstName
having COUNT(firstName) > 10;

SELECT TOP 10 * 
FROM Sales.SalesOrderDetail;

SELECT productid, sum(linetotal) as "TOTAL"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) BETWEEN 16200 AND 500000;

SELECT FirstName, COUNT(FirstName) AS "QUANTIDADE"
FROM Person.Person
WHERE Title = 'Mr.'
GROUP BY FirstName
having COUNT(firstName) > 10;

SELECT StateProvinceId, COUNT(StateProvinceId) AS "QUANTIDADE"
FROM Person.Address
GROUP BY StateProvinceId
HAVING COUNT(StateProvinceId) > 1000;

SELECT ProductId, AVG(linetotal) AS "MEDIA"
FROM sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(linetotal) < 1000000;

/* AS */

SELECT FirstName as "Nome",LastName as "Sobrenome"
FROM Person.Person;

SELECT ProductNumber as "Numero do Produto"
FROM Production.Product;

SELECT unitPrice as "Preço Unitário"
FROM Sales.SalesOrderDetail;

/* INNER JOIN */

SELECT TOP 10 *
FROM person.Person;

SELECT TOP 10 * 
FROM Person.EmailAddress;

SELECT p.BusinessEntityID, p.FirstName, p.LastName, pe.EmailAddress
FROM Person.Person as P
INNER JOIN Person.EmailAddress PE on p.BusinessEntityID = pe.BusinessEntityID;

SELECT TOP 10 *
FROM Person.BusinessEntityAddress BA
INNER JOIN Person.Address PA ON PA.AddressID = BA.AddressID;

SELECT TOP 10 * 
FROM Person.PhoneNumberType;

SELECT  pn.PhoneNumberTypeID, pn.Name, pp.PhoneNumber, pp.BusinessEntityID
FROM Person.PhoneNumberType AS pn 
INNER JOIN Person.PersonPhone pp ON pp.PhoneNumberTypeID = pn.PhoneNumberTypeID;

SELECT TOP 10 * 
FROM person.Address;

SELECT pa.AddressId, pa.city, ps.StateProvinceId, ps.name
FROM person.Address AS pa
INNER JOIN Person.StateProvince ps ON pa.StateProvinceID= ps.StateProvinceID; 

/* JOINS */

SELECT *
FROM Person.Person PP 
LEFT JOIN Sales.PersonCreditCard PC 
ON PP.BusinessEntityID = PC.BusinessEntityID
WHERE PC.BusinessEntityID IS NULL;

/* UNION */

SELECT [ProductID], [Name], [ProductNumber] FROM
Production.Product WHERE Name like '%Chain%'
UNION
SELECT [ProductID], [Name], [ProductNumber] FROM
Production.Product WHERE Name like '%Decal%'

SELECT FirstName, Title, MiddleName 
FROM Person.Person
WHERE Title = 'Mr.'
UNION
SELECT FirstName, Title, MiddleName 
FROM Person.Person
WHERE MiddleName = 'A';

SELECT FirstName, LastName 
FROM Person.Person
WHERE FirstName like '%C%'
UNION 
SELECT FirstName, LastName
FROM Person.Person
WHERE LastName like '%Z%';

/* DATEPART */

SELECT SalesOrderID, DATEPART(month, OrderDate) AS MES
FROM Sales.SalesOrderHeader;


SELECT AVG(TotalDue) AS Media, DATEPART(month, OrderDate) AS Mes
FROM sales.SalesOrderHeader
GROUP BY DATEPART(month, OrderDate)
ORDER BY Mes;

/* MANIPULAÇÃO DE STRING */

SELECT CONCAT(FirstName, LastName)
FROM Person.Person;

SELECT UPPER(FirstName), LOWER(FirstName)
FROM Person.Person;

SELECT FirstName, LEN(FirstName)
FROM Person.Person;

SELECT FirstName, SUBSTRING(FirstName,1,3)
FROM Person.Person;

SELECT productNumber, REPLACE(ProductNumber, '-', '#')
FROM Production.Product;

/* OPERAÇÕES MATEMATICAS */

SELECT UnitPrice + LineTotal
FROM Sales.SalesOrderDetail;

/* SUBQUERY */

SELECT * 
FROM Production.Product

SELECT * 
FROM Production.Product
WHERE  ListPrice > (SELECT AVG(listPrice) from Production.Product);

