# 🚀 StudentManagementAPI - Getting Started Guide

## ⚡ 60-Second Quick Start

### Step 1: Open Browser
Navigate to: **http://localhost:5215/swagger/index.html**

### Step 2: Test GET Endpoint
- Expand **GET /api/students**
- Click **"Try it out"**
- Click **"Execute"**
- See all 10 students! ✅

---

## 🎯 What You'll See

### Response Example
```json
[
  {
	"id": 1,
	"name": "Raj Kumar",
	"email": "raj@example.com",
	"course": "Computer Science"
  },
  {
	"id": 2,
	"name": "Priya Singh",
	"email": "priya@example.com",
	"course": "Information Technology"
  },
  ...more students...
]
```

---

## 🔄 Try All Endpoints

### 1. Get All Students
```
GET /api/students
```
✅ Returns list of all 10 students

### 2. Get Single Student
```
GET /api/students/1
```
✅ Returns the student with ID 1

### 3. Add New Student
```
POST /api/students

{
  "name": "John Doe",
  "email": "john@example.com",
  "course": "Data Science"
}
```
✅ Creates new student with ID 11

### 4. Update Student
```
PUT /api/students/1

{
  "name": "Raj Kumar Updated",
  "email": "raj.updated@example.com",
  "course": "Electronics"
}
```
✅ Updates student with ID 1

### 5. Delete Student
```
DELETE /api/students/5
```
✅ Deletes student with ID 5

---

## 🧪 Testing in Swagger UI

### For POST Request
1. Expand **POST /api/students**
2. Click **"Try it out"**
3. Enter JSON:
   ```json
   {
	 "name": "New Student",
	 "email": "new@example.com",
	 "course": "Machine Learning"
   }
   ```
4. Click **"Execute"**
5. See response with new ID ✅

### For PUT Request
1. Expand **PUT /api/students/{id}**
2. Click **"Try it out"**
3. Enter ID: **1**
4. Enter updated JSON
5. Click **"Execute"**
6. See "Student updated successfully." ✅

### For DELETE Request
1. Expand **DELETE /api/students/{id}**
2. Click **"Try it out"**
3. Enter ID: **5**
4. Click **"Execute"**
5. See "Student deleted successfully." ✅

---

## 📊 Sample Data

| ID | Name | Email | Course |
|----|------|-------|--------|
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

---

## 🔗 Important URLs

| Purpose | URL |
|---------|-----|
| Swagger UI | http://localhost:5215/swagger/index.html |
| API Base | http://localhost:5215/api/students |
| Get Student 1 | http://localhost:5215/api/students/1 |
| Swagger JSON | http://localhost:5215/swagger/v1/swagger.json |

---

## ✅ Common Tasks

### Add a New Student
1. Go to Swagger UI
2. Click POST /api/students
3. Click "Try it out"
4. Enter:
   ```json
   {
	 "name": "Your Name",
	 "email": "your@email.com",
	 "course": "Your Course"
   }
   ```
5. Click Execute
6. Note the returned ID ✅

### Find a Student
1. Go to Swagger UI
2. Click GET /api/students/{id}
3. Click "Try it out"
4. Enter ID (e.g., 3)
5. Click Execute
6. See student details ✅

### Update a Student
1. Go to Swagger UI
2. Click PUT /api/students/{id}
3. Click "Try it out"
4. Enter ID and updated details
5. Click Execute
6. See success message ✅

---

## 🎓 Learning Resources

### Within This Project
- **INDEX.md** - Project index
- **README.md** - Full documentation
- **QUICK_REFERENCE.md** - API reference
- **COMPLETE_SETUP_REPORT.md** - Technical details

### External Resources
- **ASP.NET Core:** https://docs.microsoft.com/en-us/aspnet/core/
- **SQL Server:** https://docs.microsoft.com/en-us/sql/
- **REST API:** https://restfulapi.net/
- **Swagger:** https://swagger.io/

---

## 🛠️ Alternative Testing Methods

### Method 1: REST Client (VS Code)
1. Install "REST Client" extension
2. Open: StudentManagementAPI/test.http
3. Click "Send Request"
4. See response instantly

### Method 2: Postman
1. Download Postman
2. Create new request
3. Set method to GET
4. URL: http://localhost:5215/api/students
5. Click Send

### Method 3: Browser (GET only)
1. Open browser
2. Go to: http://localhost:5215/api/students
3. See JSON response

### Method 4: Command Line
```bash
# Install curl if needed
# Then run:
curl http://localhost:5215/api/students
```

---

## ⚠️ Troubleshooting

### "Cannot reach server"
✅ Check if terminal shows "Now listening on: http://localhost:5215"
✅ If not, application crashed - restart with: `dotnet run`

### "Port already in use"
✅ Another app is using port 5215
✅ Stop that app or change port in launchSettings.json

### "Database connection error"
✅ StudentAPI database might not exist
✅ Run: CreateStudentAPIDatabase.sql

### "Swagger UI not loading"
✅ Refresh browser
✅ Check network connectivity
✅ Verify server is running

---

## 🎯 Next Steps

### Try These Actions
1. ✅ Get all students (GET /api/students)
2. ✅ Get one student (GET /api/students/1)
3. ✅ Add new student (POST /api/students)
4. ✅ Update a student (PUT /api/students/1)
5. ✅ Delete a student (DELETE /api/students/5)

### Then Explore
- Examine HTTP status codes
- Read the response schemas
- Try different student data
- Delete and recreate records

---

## 🏆 You're Ready!

Everything is set up and working. The API is fully functional and ready for:
- ✅ Testing
- ✅ Development
- ✅ Learning
- ✅ Production deployment (after appropriate configuration)

---

## 📞 Quick Reference

| Task | URL | Method |
|------|-----|--------|
| View API Docs | http://localhost:5215/swagger/index.html | - |
| Get All | http://localhost:5215/api/students | GET |
| Get One | http://localhost:5215/api/students/1 | GET |
| Add | http://localhost:5215/api/students | POST |
| Update | http://localhost:5215/api/students/1 | PUT |
| Delete | http://localhost:5215/api/students/5 | DELETE |

---

## 🎉 Start Testing Now!

**Open:** http://localhost:5215/swagger/index.html

**Happy testing!** 🚀
