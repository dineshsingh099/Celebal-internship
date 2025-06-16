# Student Allotment SQL Problem

This folder contains a complete SQL-based solution for the "Student Allotment" problem, as part of the Celebal Internship program.

## Folder Structure

- **Student Allotment SQL Problem.pdf**  
  The original problem statement and requirements.

- **SQL Table.sql**  
  SQL script to create all necessary tables and insert sample data for the allotment system.

- **SQL Solution.sql**  
  SQL script containing the stored procedure to perform subject allotment based on student preferences and seat availability.

- **Readme.md**  
  This documentation file.

## How to Use

1. **Set Up the Database:**
   - Open `SQL Table.sql` in your SQL editor (e.g., SSMS, Azure Data Studio).
   - Execute the script to create tables and insert sample data.

2. **Run the Allotment Logic:**
   - Open `SQL Solution.sql`.
   - Execute the script to create the `AllocateSubjects` stored procedure.
   - Run the procedure using:
     ```sql
     EXEC AllocateSubjects;
     ```
   - This will process the allotment and update the `Allotments` and `UnallotedStudents` tables.

3. **Review Results:**
   - Query the `Allotments` table to see which students were allotted which subjects.
   - Query the `UnallotedStudents` table to see which students did not get any subject.

## Solution Highlights

- Allotment is based on student GPA (higher GPA gets preference).
- Each student is allotted their highest-preference subject with available seats.
- Unallotted students are tracked separately.
- Uses temporary tables and a cursor for stepwise allocation.

## Notes

- Adjust table or column names if your schema differs from the provided scripts.
- The sample data can be modified as needed for testing.

---

**Author:**  
Celebal Internship Candidate  
June