# StudentManagementAPI - Quick Reference Guide

## 🚀 Application Running
- **URL:** http://localhost:5215
- **Port:** 5215
- **Status:** ✅ RUNNING

## 📊 Database
- **Name:** StudentAPI
- **Server:** (LocalDB)\MSSQLLocalDB
- **Records:** 10 Students
- **Status:** ✅ ACTIVE

## 🧪 Testing the API

### Method 1: Swagger UI (Easiest)
```
Navigate to: http://localhost:5215/swagger/index.html
```
Then click on any endpoint and click "Try it out" → "Execute"

### Method 2: Browser (GET only)
```
http://localhost:5215/api/students
http://localhost:5215/api/students/1
http://localhost:5215/api/students/2
```

### Method 3: REST Client (VS Code)
1. Install "REST Client" extension
2. Open: `StudentManagementAPI/test.http`
3. Click "Send Request" on any endpoint

### Method 4: Postman
```
Create New Request:
- Method: GET
- URL: http://localhost:5215/api/students
- Send
```

## 📝 API Endpoints Reference

### GET All Students
```
GET http://localhost:5215/api/students
```
Response:
```json
[
  { "id": 1, "name": "Raj Kumar", "email": "raj@example.com", "course": "Computer Science" },
  { "id": 2, "name": "Priya Singh", "email": "priya@example.com", "course": "Information Technology" },
  ...
]
```

### GET Single Student
```
GET http://localhost:5215/api/students/1
```
Response:
```json
{
  "id": 1,
  "name": "Raj Kumar",
  "email": "raj@example.com",
  "course": "Computer Science"
}
```

### POST - Add New Student
```
POST http://localhost:5215/api/students
Content-Type: application/json

{
  "name": "New Student",
  "email": "new@example.com",
  "course": "Data Science"
}
```
Response:
```json
{
  "id": 11,
  "name": "New Student",
  "email": "new@example.com",
  "course": "Data Science"
}
```

### PUT - Update Student
```
PUT http://localhost:5215/api/students/1
Content-Type: application/json

{
  "name": "Updated Name",
  "email": "updated@example.com",
  "course": "Electronics"
}
```
Response:
```
"Student updated successfully."
```

### DELETE - Delete Student
```
DELETE http://localhost:5215/api/students/5
```
Response:
```
"Student deleted successfully."
```

## 🎓 Sample Student Data

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

## 📋 Project Structure
```
StudentManagementAPI/
├── Controllers/
│   └── StudentsController.cs      ← API implementation
├── Models/
│   └── Student.cs                 ← Data model
├── Properties/
│   └── launchSettings.json
├── Program.cs                     ← Application entry point
├── appsettings.json              ← Configuration
├── StudentManagementAPI.csproj    ← Project file
├── test.http                      ← Test file for REST Client
└── StudentManagementAPI.sln       ← Solution file
```

## 🔧 Troubleshooting

### "Cannot connect to database"
```
✅ Solution: Run CreateStudentAPIDatabase.sql
sqlcmd -S "(LocalDB)\MSSQLLocalDB" -i CreateStudentAPIDatabase.sql -E
```

### "API not responding"
```
✅ Solution: Restart the application
1. Stop the running process (Ctrl+C)
2. Run: dotnet run
```

### "Port already in use"
```
✅ Solution: Check launchSettings.json and change port number
```

### "Missing packages"
```
✅ Solution: Run:
dotnet restore
dotnet build
dotnet run
```

## 🛠️ Useful Commands

### Run the application
```bash
cd StudentManagementAPI
dotnet run
```

### Restore dependencies
```bash
dotnet restore
```

### Build the project
```bash
dotnet build
```

### View launchSettings
```bash
cat Properties/launchSettings.json
```

### Create database
```bash
sqlcmd -S "(LocalDB)\MSSQLLocalDB" -i CreateStudentAPIDatabase.sql -E
```

## 📌 Important Notes

1. **Application Port:** 5215 (can be changed in launchSettings.json)
2. **Database:** Automatically uses StudentAPI
3. **Authentication:** Windows Integrated Security (using your computer account)
4. **Swagger:** Available for interactive API testing
5. **Sample Data:** Pre-loaded with 10 students

## ✅ What's Working

- ✅ Database connection
- ✅ All CRUD operations
- ✅ Student data persistence
- ✅ Error handling
- ✅ API documentation (Swagger)
- ✅ Parameterized queries (SQL injection protection)

---

**Everything is set up and ready to use! Happy testing! 🎉**
