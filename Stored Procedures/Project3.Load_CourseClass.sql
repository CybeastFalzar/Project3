SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Project3].[Load_CourseClass] 
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT INTO Courses.CourseClass
	(
	    CourseID,
	    CourseName,
	    Class,
	    SectionNo,
		ModeOfInstruction
	)
	SELECT C.CourseID, C.CourseName, CL.Class, NCO.Sec, M.InstructionType
	FROM Uploadfile.NormalizedCourseOffering AS NCO INNER JOIN
		 Courses.Course AS C ON C.CourseName = NCO.[Course (hr, crd)] INNER JOIN
		 Courses.Class AS CL ON CL.Class = NCO.Description INNER JOIN
		 Courses.ModeOfInstruction AS M ON M.InstructionType = NCO.[Mode of Instruction]



	
	
END



GO
