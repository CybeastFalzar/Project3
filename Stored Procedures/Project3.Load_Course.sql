SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Project3].[Load_Course] 
AS
BEGIN
	ALTER SEQUENCE [Courses].[CourseKey] RESTART WITH 1
	SET NOCOUNT ON;

		
INSERT INTO Courses.Course
(
    CourseID,
    CourseName,
    Department
)

SELECT NEXT VALUE FOR Courses.CourseKey, O.[Course (hr, crd)], O.DepartmentName
FROM (SELECT DISTINCT [Course (hr, crd)],DepartmentName FROM Uploadfile.NormalizedCourseOffering) AS O

END



GO
