-- Create SmartCampusDB Database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'SmartCampusDB')
BEGIN
	CREATE DATABASE SmartCampusDB;
END
GO

USE SmartCampusDB;
GO

-- Create ServiceRequests Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'ServiceRequests')
BEGIN
	CREATE TABLE ServiceRequests
	(
		RequestId INT PRIMARY KEY IDENTITY(1,1),
		StudentName NVARCHAR(255) NOT NULL,
		Department NVARCHAR(255) NOT NULL,
		ServiceType NVARCHAR(255) NOT NULL,
		Description NVARCHAR(MAX) NOT NULL,
		Priority NVARCHAR(50),
		Status NVARCHAR(50),
		RequestDate DATETIME DEFAULT GETDATE()
	);
END
GO

-- Insert Sample Data
INSERT INTO ServiceRequests (StudentName, Department, ServiceType, Description, Priority, Status, RequestDate)
VALUES 
	('Raj Kumar', 'Computer Science', 'Hostel Issue', 'Air conditioner not working in room 302', 'High', 'Pending', GETDATE()),
	('Priya Singh', 'Information Technology', 'Library Issue', 'Book lost and need to report', 'Medium', 'In Progress', DATEADD(HOUR, -2, GETDATE())),
	('Amit Patel', 'Electronics', 'Maintenance', 'Lab equipment needs repair', 'High', 'Completed', DATEADD(DAY, -1, GETDATE())),
	('Neha Sharma', 'Computer Science', 'Academics', 'Need course registration help', 'Medium', 'Pending', DATEADD(HOUR, -4, GETDATE())),
	('Vikram Das', 'Mechanical', 'Transport', 'Need campus shuttle schedule', 'Low', 'Completed', DATEADD(DAY, -2, GETDATE())),
	('Anjali Verma', 'Information Technology', 'Hostel Issue', 'Water shortage in hostel', 'High', 'In Progress', DATEADD(HOUR, -1, GETDATE())),
	('Ravi Gupta', 'Civil Engineering', 'Canteen', 'Quality complaint about food', 'Medium', 'Pending', DATEADD(HOUR, -3, GETDATE())),
	('Deepika Nair', 'Computer Science', 'Health', 'Medical emergency assistance needed', 'High', 'Completed', DATEADD(DAY, -1, GETDATE())),
	('Sahil Khan', 'Information Technology', 'IT Support', 'WiFi connectivity issue', 'Medium', 'In Progress', DATEADD(HOUR, -30, GETDATE())),
	('Ritika Joshi', 'Electronics', 'Hostel Issue', 'Noisy neighbors complaint', 'Low', 'Pending', GETDATE());
GO

-- Verify data
SELECT COUNT(*) AS TotalRequests FROM ServiceRequests;
SELECT TOP 5 * FROM ServiceRequests;
