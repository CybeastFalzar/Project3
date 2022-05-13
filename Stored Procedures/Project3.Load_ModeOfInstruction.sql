SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Project3].[Load_ModeOfInstruction] 
AS
BEGIN
	
	SET NOCOUNT ON;
	INSERT INTO Courses.ModeOfInstruction
	(
	    InstructionType
	)
	
	SELECT DISTINCT [Mode of Instruction]
	FROM Uploadfile.NormalizedCourseOffering


	

END



GO
