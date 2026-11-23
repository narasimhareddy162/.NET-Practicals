-- Create StudentAPI Database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'StudentAPI')
BEGIN
	CREATE DATABASE StudentAPI;
END
GO

USE StudentAPI;
GO

-- Create Students Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Students')
BEGIN
	CREATE TABLE Students
	(
		Id INT PRIMARY KEY IDENTITY(1,1),
		Name NVARCHAR(255) NOT NULL,
		Email NVARCHAR(255) NOT NULL,
		Course NVARCHAR(255) NOT NULL
	);
END
GO

-- Insert Sample Data
INSERT INTO Students (Name, Email, Course)
VALUES 
	('Raj Kumar', 'raj@example.com', 'Computer Science'),
	('Priya Singh', 'priya@example.com', 'Information Technology'),
	('Amit Patel', 'amit@example.com', 'Software Engineering'),
	('Neha Sharma', 'neha@example.com', 'Computer Science'),
	('Vikram Das', 'vikram@example.com', 'Electronics'),
	('Anjali Verma', 'anjali@example.com', 'Information Technology'),
	('Ravi Gupta', 'ravi@example.com', 'Computer Science'),
	('Deepika Nair', 'deepika@example.com', 'Software Engineering'),
	('Sahil Khan', 'sahil@example.com', 'Information Technology'),
	('Ritika Joshi', 'ritika@example.com', 'Computer Science');
GO

-- Verify data
SELECT COUNT(*) AS TotalStudents FROM Students;
SELECT * FROM Students;
