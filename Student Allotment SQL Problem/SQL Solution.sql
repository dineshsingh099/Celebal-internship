CREATE PROCEDURE AllocateSubjects
AS
BEGIN
    SET NOCOUNT ON;

    CREATE TABLE #Allotments (
        StudentId INT,
        SubjectId VARCHAR(20)
    );

    CREATE TABLE #UnallotedStudents (
        StudentId INT
    );

    DECLARE @StudentId INT;
    DECLARE student_cursor CURSOR FOR
        SELECT StudentId
        FROM StudentDetails
        ORDER BY GPA DESC;

    OPEN student_cursor;
    FETCH NEXT FROM student_cursor INTO @StudentId;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE @Preference INT = 1;
        DECLARE @SubjectId VARCHAR(20);
        DECLARE @Allotted BIT = 0;

        WHILE @Preference <= 5 AND @Allotted = 0
        BEGIN
            SELECT @SubjectId = SubjectId
            FROM StudentPreference
            WHERE StudentId = @StudentId AND Preference = @Preference;

            IF EXISTS (
                SELECT 1 FROM SubjectDetails
                WHERE SubjectId = @SubjectId AND RemainingSeats > 0
            )
            BEGIN
                INSERT INTO #Allotments (StudentId, SubjectId)
                VALUES (@StudentId, @SubjectId);

                UPDATE SubjectDetails
                SET RemainingSeats = RemainingSeats - 1
                WHERE SubjectId = @SubjectId;

                SET @Allotted = 1;
            END

            SET @Preference = @Preference + 1;
        END

        IF @Allotted = 0
        BEGIN
            INSERT INTO #UnallotedStudents (StudentId)
            VALUES (@StudentId);
        END

        FETCH NEXT FROM student_cursor INTO @StudentId;
    END

    CLOSE student_cursor;
    DEALLOCATE student_cursor;

    INSERT INTO Allotments (SubjectId, StudentId)
    SELECT SubjectId, StudentId FROM #Allotments;

    INSERT INTO UnallotedStudents (StudentId)
    SELECT StudentId FROM #UnallotedStudents;

    DROP TABLE #Allotments;
    DROP TABLE #UnallotedStudents;
END;
