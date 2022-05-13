SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Project3].[Load_Instructor] 
AS
BEGIN
	ALTER SEQUENCE [Staff].[InstructorKey] RESTART WITH 1
	SET NOCOUNT ON;

		
INSERT INTO [Staff].Instructor
(
	InstructorID,
    FirstName,
	LastName,
	FullName
)
SELECT NEXT VALUE FOR [Staff].InstructorKey, substring(instructor, charindex(',',instructor)+1,20), TRIM(' ,' FROM (SUBSTRING(Instructor, 1, CHARINDEX(', ',instructor)+1))), X.Instructor
FROM(SELECT DISTINCT Instructor FROM Uploadfile.NormalizedCourseOffering) AS X

END



GO
