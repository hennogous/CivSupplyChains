-- Sample SQL syntax

-- Create a table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

-- Insert data into the table
INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate, Salary)
VALUES (1, 'John', 'Doe', '2023-01-15', 55000.00);

-- Select data from the table
SELECT * FROM Employees;

-- Update data in the table
UPDATE Employees
SET Salary = 60000.00
WHERE EmployeeID = 1;

-- Delete data from the table
DELETE FROM Employees
WHERE EmployeeID = 1;

-- Drop the table
DROP TABLE Employees;