-- Drop existing tables if they exist
USE PlacementDB;
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Students')
BEGIN
	DROP TABLE Students;
END
GO

-- Create Students Table with comprehensive student information
CREATE TABLE Students
(
	StudentId INT PRIMARY KEY IDENTITY(1,1),
	StudentName NVARCHAR(255) NOT NULL,
	RollNumber NVARCHAR(50) NOT NULL UNIQUE,
	Email NVARCHAR(255),
	PhoneNumber NVARCHAR(15),
	CGPA DECIMAL(4, 2),
	IsPlaced BIT DEFAULT 0,
	PlacementId INT NULL,
	CompanyName NVARCHAR(255),
	JobRole NVARCHAR(255),
	PackageLPA DECIMAL(10, 2)
);
GO

-- Insert Student Data - Mix of Placed and Unplaced
INSERT INTO Students (StudentName, RollNumber, Email, PhoneNumber, CGPA, IsPlaced, PlacementId, CompanyName, JobRole, PackageLPA)
VALUES 
	('Raj Kumar', 'CSE001', 'raj@example.com', '9876543210', 8.5, 1, 1, 'TCS', 'Software Engineer', 8.50),
	('Priya Singh', 'CSE002', 'priya@example.com', '9876543211', 8.2, 1, 2, 'Infosys', 'Systems Engineer', 7.50),
	('Amit Patel', 'CSE003', 'amit@example.com', '9876543212', 7.8, 1, 3, 'Cognizant', 'Technology Analyst', 6.50),
	('Neha Sharma', 'CSE004', 'neha@example.com', '9876543213', 7.5, 1, 4, 'Accenture', 'Associate Software Engineer', 7.00),
	('Vikram Das', 'CSE005', 'vikram@example.com', '9876543214', 7.9, 1, 5, 'Wipro', 'Project Engineer', 6.80),
	('Anjali Verma', 'CSE006', 'anjali@example.com', '9876543215', 7.2, 0, NULL, NULL, NULL, NULL),
	('Ravi Gupta', 'CSE007', 'ravi@example.com', '9876543216', 6.8, 0, NULL, NULL, NULL, NULL),
	('Deepika Nair', 'CSE008', 'deepika@example.com', '9876543217', 8.1, 1, 6, 'HCL Technologies', 'Software Developer', 7.20),
	('Sahil Khan', 'CSE009', 'sahil@example.com', '9876543218', 7.4, 0, NULL, NULL, NULL, NULL),
	('Ritika Joshi', 'CSE010', 'ritika@example.com', '9876543219', 8.3, 1, 7, 'IBM', 'Systems Engineer', 8.00);
GO

-- Verify data
SELECT COUNT(*) AS TotalStudents FROM Students;
SELECT COUNT(*) AS PlacedStudents FROM Students WHERE IsPlaced = 1;
SELECT COUNT(*) AS UnplacedStudents FROM Students WHERE IsPlaced = 0;
SELECT MAX(PackageLPA) AS HighestPackage FROM Students WHERE PackageLPA IS NOT NULL;

-- Display all student records
SELECT StudentId, StudentName, RollNumber, CGPA, IsPlaced, CompanyName, JobRole, PackageLPA 
FROM Students 
ORDER BY StudentId;
