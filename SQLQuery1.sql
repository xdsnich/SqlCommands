CREATE DATABASE EmploeeDb

USE profiles
DROP DATABASE EmploeeDb


CREATE DATABASE Employees

USE Employees

CREATE TABLE Employees(
	Id INT PRIMARY KEY,
	Name VARCHAR(50),
	Position VARCHAR(50),
	Salary VARCHAR(50)
);

DROP TABLE Employees

CREATE TABLE Employees(
	Id INT,
	Name VARCHAR(50),
	Position VARCHAR(50),
	Salary VARCHAR(50)
)

ALTER TABLE Employees
ADD HireDate DATETIME

ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(30) NOT NULL; 

ALTER TABLE Employees
ALTER COLUMN Id INT NOT NULL;

ALTER TABLE Employees
ADD CONSTRAINT PK_Id PRIMARY KEY(Id)

ALTER TABLE Employees
ADD Bonuses INT;

ALTER TABLE Employees
ALTER COLUMN Bonuses FLOAT;

ALTER TABLE Employees
ADD DOM INT

ALTER TABLE Employees
DROP COLUMN DOM

CREATE TABLE Department(
	DepartmentName CHAR NOT NULL
);

ALTER TABLE Employees 
ADD CONSTRAINT U_Id UNIQUE(Id);

ALTER TABLE Department 
ADD DepartmentId INT PRIMARY KEY

BEGIN TRANSACTION;

ALTER TABLE Employees 
ADD DepartmentID INT

ALTER TABLE Department
Add DepartmentId INT PRIMARY KEY

ALTER TABLE Employees
ADD CONSTRAINT Fk_DepartmentId FOREIGN KEY (DepartmentID)
REFERENCES Department(DepartmentId)

COMMIT TRANSACTION;

CREATE INDEX nameIndex
On Employees(Name)

INSERT INTO Department(DepartmentName) VALUES(
	'B', 1
);

ALTER TABLE Department 
ALTER COLUMN DepartmentName VARCHAR(30)

INSERT INTO Department (DepartmentName, DepartmentId) VALUES(
	'Backend', 2
);

INSERT INTO Employees (Id, Name, Position, Salary, Bonuses, DepartmentId) VALUES(
	1, 'xdxd', 'backend', '1000', '100', 2
);


INSERT INTO Department (DepartmentId, DepartmentName) VALUES
	(3, 'frontend'),
	(4, 'fullstack');


INSERT INTO Employees (Id, Name, Position, Salary, Bonuses, DepartmentId) VALUES
	(2, 'freak', 'backend', '1000', '100', 2),
	(3, 'geek', 'frontent', '800', '0', 3),
	(4, 'snich', 'backend', '1000', '100', 2),
	(5, 'blunt', 'backend', '1000', '50', 2),
	(6, 'vamp', 'fullstack', '1200', '70', 4),
	(7, 'greens', 'frontend', '800', '100', 3);


SELECT *
FROM Employees

SELECT *
FROM Employees
WHERE DepartmentId = 2

SELECT *
FROM Employees
WHERE DepartmentId = 2 AND Bonuses < 100

SELECT *
FROM Employees
WHERE DepartmentId = 2 
ORDER BY Name


SELECT *
FROM Employees
WHERE DepartmentId = 2 OR DepartmentId = 3

SELECT *
FROM Employees
WHERE NOT Name = 'blunt'


SELECT *
FROM Employees
WHERE HireDate = null

UPDATE Employees
SET DepartmentID = 4
WHERE Bonuses = 0

DELETE 
FROM Department
WHERE DepartmentId = 1 

SELECT TOP 5 *
FROM Employees
WHERE Bonuses >= 0

SELECT TOP 5 *
FROM Employees
WHERE Bonuses >= 0
ORDER BY Name ASC

SELECT *
FROM Employees
WHERE Bonuses >= 0
ORDER BY Id DESC
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY

SELECT COUNT(Name) AS WorkerQuantity
FROM Employees

SELECT COUNT(Id) AS WorkerQuantity
FROM Employees
WHERE Bonuses > 50

SELECT COUNT(Id) AS WorkerQuantity
FROM Employees
WHERE HireDate = NULL

SELECT SUM(Bonuses) AS TotalFeed
FROM Employees
WHERE Salary > 0

SELECT AVG(Bonuses) AS AVGFeed
FROM Employees
WHERE Bonuses >= 0

SELECT MIN(Bonuses) AS MINFeed
FROM Employees

SELECT MAX(Bonuses) AS MAXFeed
FROM Employees
GROUP BY Position

SELECT *
FROM Employees 
LEFT JOIN Department ON Name = DepartmentName

SELECT Employees.Name, Department.DepartmentId
FROM Employees
INNER JOIN Department ON Department.DepartmentId = Employees.DepartmentID

SELECT Employees.Name, Department.DepartmentName
FROM Employees
LEFT JOIN Department ON Employees.DepartmentID = Department.DepartmentId

SELECT Employees.Salary, Department.DepartmentName
FROM Employees
LEFT JOIN Department ON Employees.DepartmentID = Department.DepartmentId
WHERE Bonuses > 50

SELECT Employees.Salary, Department.DepartmentName
FROM Department
RIGHT JOIN Employees ON Employees.DepartmentID = Department.DepartmentId;

SELECT DepartmentId
FROM Department
UNION
SELECT DepartmentID
FROM Employees

SELECT DepartmentId
FROM Department
UNION ALL
SELECT DepartmentID
FROM Employees

SELECT Name, Employees.Position, Employees.Salary, Department.DepartmentName
FROM Employees 
INNER JOIN Department ON Employees.DepartmentID = Department.DepartmentId;


INSERT INTO Employees (Id, Position, Bonuses, Name, Salary, DepartmentID) VALUES 
	(8, 'backend', 10, 'Adixy', null, 2),
	(9, 'fullstack', null, 'King', 870, 4),
	(10, 'backend', 20, 'Queen', 100, 2),
	(11, null, 20, 'Alex', 700, 2),
	(12, 'frontend', 40, 'Ura', null, 2),
	(13, 'fullstack', 20, 'Vasil', 600, 4),
	(14, 'backend', null, 'Gena', 490, 2),
	(15, null, 20, 'Sergii', 310, 2),
	(16, 'frontend', 30, 'Vova', 1100, 3),
	(17, 'fullstack', 60, 'Max', null, 4);

Select Employees.Name, Employees.Position, Department.DepartmentName
FROM Employees
LEFT JOIN Department ON Employees.DepartmentID = Department.DepartmentId
WHERE Bonuses > 30

ALTER TABLE Employees
ALTER COLUMN DepartmentID INT NULL 

INSERT INTO Employees (Id, Position, Bonuses, Name, Salary, DepartmentID) VALUES 
	(18, 'backend', null, 'Adixy', null, 2),
	(19, 'fullstack', null, 'King', 1370, null),
	(20, 'backend', 20, 'Queen', 150, null),
	(21, null, 20, 'Alex', 700, null),
	(22, 'frontend', 90, 'Ura', null, 2),
	(23, 'fullstack', 45, 'Vasil', 600, 4),
	(24, 'backend', null, 'Gena', 490, null),
	(25, null, 25, 'Sergii', 310, null),
	(26, 'frontend', 5, 'Vova', 1100, null),
	(27, 'fullstack', 55, 'Max', null, null);

SELECT Employees.Name, Employees.Salary, Department.DepartmentName
FROM Employees
INNER JOIN Department ON Employees.DepartmentID = Department.DepartmentId

SELECT Employees.Name, Employees.Salary, Department.DepartmentName
FROM Employees
FULL OUTER JOIN Department ON Employees.DepartmentID = Department.DepartmentId

SELECT DepartmentId, DepartmentName
FROM Department
UNION
SELECT Name, Position
FROM Employees
WHERE Salary = NULL

SELECT Department.DepartmentId
FROM Department
WHERE DepartmentId > 2
UNION
SELECT Employees.Bonuses
FROM Employees

SELECT DepartmentID, COUNT(Name) AS AmountOfDepartments
FROM Employees
GROUP BY DepartmentID

SELECT Bonuses, COUNT(Id) AS EachBounusCount
FROM Employees
GROUP BY Bonuses

SELECT *
FROM Employees
WHERE Bonuses = (SELECT MAX(Bonuses) FROM Employees)

SELECT Name , Bonuses
FROM Employees
WHERE Bonuses = (SELECT MIN(Bonuses) FROM Employees)

SELECT MAX(Name)
FROM Employees

SELECT Position, SUM(Bonuses) AS TotalBonuses
FROM Employees
GROUP BY Position
HAVING SUM(Bonuses) > 200

SELECT Name
FROM Employees
WHERE EXISTS(
	SELECT 1
	FROM Department
	WHERE Employees.DepartmentID = Department.DepartmentId 
	AND Department.DepartmentName = 'backend'
	)

SELECT DepartmentName
FROM Department
WHERE EXISTS (
    SELECT 1
    FROM Employees 
    WHERE Employees.DepartmentID = Department.DepartmentId
    AND Employees.Bonuses > 30
);

SELECT TOP 10*
FROM Employees
ORDER BY Bonuses DESC

BEGIN TRANSACTION
SELECT TOP 10*
INTO TopPerformers
FROM Employees
ORDER BY Bonuses DESC


ALTER TABLE TopPerformers
ADD CONSTRAINT FK_Id FOREIGN KEY(Id)
REFERENCES Employees(Id);


COMMIT TRANSACTION

SELECT Name, Bonuses,
	CASE
		WHEN Bonuses < 30 THEN 'LOW BONUSES'
		WHEN Bonuses >= 30 AND Bonuses < 60 THEN 'MID BONUSES'
		WHEN Bonuses >= 60 THEN 'HIGH BONUSES'
		ELSE 'UNKNOWN'
	END AS BonusesLevel
FROM Employees;

CREATE VIEW HighBonuses AS
SELECT Name, Bonuses
FROM Employees
WHERE Bonuses >= 60;

SELECT * 
FROM HighBonuses

CREATE OR ALTER VIEW EmployeeBonuses AS
SELECT Name, Bonuses, Position
FROM Employees
WHERE Bonuses > 0;

SELECT *
FROM EmployeeBonuses

BEGIN TRANSACTION;

IF OBJECT_ID('dbo.EmployeesBonuses', 'V') IS NOT NULL
    DROP VIEW EmployeesBonuses;

IF OBJECT_ID('dbo.HighBonuses', 'V') IS NOT NULL
    DROP VIEW HighBonuses;

COMMIT TRANSACTION;

SELECT Name, Salary
FROM Employees
WHERE Bonuses > ANY (SELECT Bonuses FROM Employees WHERE Bonuses > 10);

SELECT Name, Salary
FROM Employees
WHERE Position > ALL (SELECT Position FROM Employees WHERE Position = 'backend');

CREATE PROCEDURE GetEmployeeById
    @EmployeeId INT
AS
BEGIN
    SELECT Name, Position, Salary
    FROM Employees
    WHERE Id = @EmployeeId;
END;

EXEC GetEmployeeById @EmployeeId = 3

CREATE PROCEDURE AutoInsert

	@Name VARCHAR(30),
	@Position VARCHAR(50),
	@Salary VARCHAR(50),
	@Bonuses FLOAT
AS
BEGIN 
	INSERT INTO Employees(Name, Position, Salary, Bonuses)
	VALUES (@Name, @Position, @Salary, @Bonuses);
END

EXEC AutoInsert 
    @Name = 'lil T', 
    @Position = 'Tester', 
    @Salary = '720', 
    @Bonuses = 70;