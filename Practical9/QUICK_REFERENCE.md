# Quick Reference - PlacementDB Schema & Code Changes

## Database Schema - Students Table

| Column | Data Type | Constraints | Purpose |
|--------|-----------|-------------|---------|
| StudentId | INT | PRIMARY KEY, IDENTITY(1,1) | Unique student identifier |
| StudentName | NVARCHAR(255) | NOT NULL | Student's full name |
| RollNumber | NVARCHAR(50) | UNIQUE, NOT NULL | Student's roll number |
| Email | NVARCHAR(255) | - | Student's email |
| PhoneNumber | NVARCHAR(15) | - | Student's phone |
| CGPA | DECIMAL(4,2) | - | Cumulative GPA |
| IsPlaced | BIT | DEFAULT 0 | 1=Placed, 0=Unplaced |
| PlacementId | INT | - | Placement reference |
| CompanyName | NVARCHAR(255) | - | Recruiting company |
| JobRole | NVARCHAR(255) | - | Job position title |
| PackageLPA | DECIMAL(10,2) | - | Annual package in LPA |

## Critical SQL Query Changes

### Before (Incorrect)
```sql
-- Wrong: Counted all students as placed
SELECT COUNT(DISTINCT StudentId) FROM Students  -- Returns 5 or 10
```

### After (Correct)
```sql
-- Dashboard counts
SELECT COUNT(*) FROM Students  -- Total students
SELECT COUNT(*) FROM Students WHERE IsPlaced = 1  -- Placed count
SELECT COUNT(*) FROM Students WHERE IsPlaced = 0  -- Unplaced count
SELECT MAX(PackageLPA) FROM Students WHERE PackageLPA IS NOT NULL  -- Highest package
```

## C# Code Changes

### Default.aspx.cs
```csharp
// Fixed LoadSummary method - Now correctly calculates stats
private void LoadSummary()
{
	// ... queries for:
	// - Total students
	// - Placed students (WHERE IsPlaced = 1)
	// - Unplaced students (WHERE IsPlaced = 0)
	// - Highest package
	// - Placement percentage
}

// Updated LoadPlacements method - Shows all student details
private void LoadPlacements()
{
	// Returns: StudentId, StudentName, RollNumber, CGPA, IsPlaced,
	//          CompanyName, JobRole, PackageLPA
}
```

### Companies.aspx.cs
```csharp
// LoadCompanies - Only placed students, sorted by package DESC
// LoadPlacements - Only placed students, sorted by StudentId
```

## Sample Data (10 Students)

### Placed Students (7)
1. Raj Kumar (8.50 LPA) @ TCS
2. Priya Singh (7.50 LPA) @ Infosys
3. Amit Patel (6.50 LPA) @ Cognizant
4. Neha Sharma (7.00 LPA) @ Accenture
5. Vikram Das (6.80 LPA) @ Wipro
6. Deepika Nair (7.20 LPA) @ HCL Technologies
7. Ritika Joshi (8.00 LPA) @ IBM

### Unplaced Students (3)
8. Anjali Verma
9. Ravi Gupta
10. Sahil Khan

## Expected Dashboard Output
```
Total Students: 10
Placed Students: 7
Unplaced Students: 3
Highest Package: 8.50 LPA
Placement %: 70.00%
```

## How to Recreate Database
Run the SQL script: `CreateDatabaseV2.sql`
```bash
sqlcmd -S "(LocalDB)\MSSQLLocalDB" -i CreateDatabaseV2.sql -E
```

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "Cannot open database" | Run CreateDatabaseV2.sql |
| Unplaced shows "N/A" | Update code to query IsPlaced = 0 |
| Wrong placement count | Verify WHERE IsPlaced = 1 in query |
| Highest package incorrect | Add WHERE PackageLPA IS NOT NULL |

