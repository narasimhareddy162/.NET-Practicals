# ✅ StudentManagementAPI - Running Successfully!

## Application Status
🟢 **RUNNING** - Application started successfully

### Server Details
- **URL:** http://localhost:5215
- **Status:** Application started and listening
- **Environment:** Development
- **Framework:** ASP.NET Core 8.0

## Database Configuration
✅ **Database Created:** StudentAPI
- **Server:** (LocalDB)\MSSQLLocalDB
- **Connection String:** `Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=StudentAPI;Integrated Security=True`
- **Status:** Connected and working

### Database Schema
**Table: Students**
```sql
CREATE TABLE Students
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(255) NOT NULL,
	Email NVARCHAR(255) NOT NULL,
	Course NVARCHAR(255) NOT NULL
)
```

## Sample Data (10 Students)
| Id | Name | Email | Course |
|---|---|---|---|
| 1 | Raj Kumar | raj@example.com | Computer Science |
| 2 | Priya Singh | priya@example.com | Information Technology |
| 3 | Amit Patel | amit@example.com | Software Engineering |
| 4 | Neha Sharma | neha@example.com | Computer Science |
| 5 | Vikram Das | vikram@example.com | Electronics |
| 6 | Anjali Verma | anjali@example.com | Information Technology |
| 7 | Ravi Gupta | ravi@example.com | Computer Science |
| 8 | Deepika Nair | deepika@example.com | Software Engineering |
| 9 | Sahil Khan | sahil@example.com | Information Technology |
| 10 | Ritika Joshi | ritika@example.com | Computer Science |

## API Endpoints

### GET - Retrieve All Students
```
GET http://localhost:5215/api/students
Response: [
  { "id": 1, "name": "Raj Kumar", "email": "raj@example.com", "course": "Computer Science" },
  ...
]
```

### GET - Retrieve Single Student
```
GET http://localhost:5215/api/students/{id}
Example: GET http://localhost:5215/api/students/1
Response: { "id": 1, "name": "Raj Kumar", "email": "raj@example.com", "course": "Computer Science" }
```

### POST - Add New Student
```
POST http://localhost:5215/api/students
Body: { "name": "New Student", "email": "new@example.com", "course": "Computer Science" }
Response: { "id": 11, "name": "New Student", "email": "new@example.com", "course": "Computer Science" }
```

### PUT - Update Student
```
PUT http://localhost:5215/api/students/{id}
Example: PUT http://localhost:5215/api/students/1
Body: { "name": "Updated Name", "email": "updated@example.com", "course": "Electronics" }
Response: "Student updated successfully."
```

### DELETE - Delete Student
```
DELETE http://localhost:5215/api/students/{id}
Example: DELETE http://localhost:5215/api/students/5
Response: "Student deleted successfully."
```

## Swagger UI
- **URL:** http://localhost:5215/swagger/index.html
- Access this URL in your browser to test the API interactively

## Project Structure
```
StudentManagementAPI/
├── Controllers/
│   └── StudentsController.cs      (API endpoints)
├── Models/
│   └── Student.cs                 (Data model)
├── Properties/
│   └── launchSettings.json        (Server configuration)
├── Program.cs                     (Application startup)
├── appsettings.json              (Configuration)
├── StudentManagementAPI.csproj    (Project file)
└── StudentManagementAPI.sln       (Solution file)
```

## Build & Run Information
✅ **Build Status:** SUCCESS
- .NET SDK: 11.0.100
- Target Framework: net8.0
- Build Time: 7.30 seconds

✅ **Dependencies Installed:**
- Microsoft.Data.SqlClient v7.1.1
- Swashbuckle.AspNetCore v6.6.2

## How to Test the API

### Method 1: Using Swagger UI (Browser)
1. Open: http://localhost:5215/swagger/index.html
2. Click on each endpoint to expand
3. Click "Try it out" button
4. Enter parameters if needed
5. Click "Execute"

### Method 2: Using Postman
1. Download Postman
2. Create requests to http://localhost:5215/api/students
3. Test all CRUD operations

### Method 3: Using VS Code REST Client
Create a file `test.http` with:
```http
### Get all students
GET http://localhost:5215/api/students

### Get student by ID
GET http://localhost:5215/api/students/1

### Add new student
POST http://localhost:5215/api/students
Content-Type: application/json

{
  "name": "Test Student",
  "email": "test@example.com",
  "course": "Computer Science"
}
```

## Important Notes
- The API is currently running in Development mode
- HTTPS redirection is configured but may show warnings in development
- Database connection is using Windows Integrated Authentication
- All 10 sample students are pre-loaded in the database

## Files Created
✅ `CreateStudentAPIDatabase.sql` - Database initialization script

## Connection String
```
Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=StudentAPI;Integrated Security=True
```

---
**Status: ✅ FULLY OPERATIONAL AND READY FOR TESTING**

The StudentManagementAPI is running successfully on http://localhost:5215!
