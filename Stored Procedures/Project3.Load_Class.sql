SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Project3].[Load_Class] 
AS
BEGIN
	SET NOCOUNT ON;
	ALTER SEQUENCE Courses.ClassKey RESTART WITH 1

	INSERT INTO Courses.Class
	(
	    ClassID,
	    Class,
		NumberOfClasses
	)
	
	SELECT NEXT VALUE FOR Courses.ClassKey, O.[Description], COUNT(*)
	FROM Uploadfile.NormalizedCourseOffering AS O
	--WHERE O.Description = 'Conceptual Physics Lab'
	GROUP BY O.[Description]
	
END



GO
