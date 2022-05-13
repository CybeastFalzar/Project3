SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Tahreem Ishfaq
-- Create date: 05/12/2022
-- Description:	
-- =============================================
CREATE PROCEDURE [Project3].[Load_InstructorDepartments]
AS
BEGIN
	--ALTER SEQUENCE [Staff].[InstructorDepartmentsKey] RESTART WITH 1
	SET NOCOUNT ON;

	        
INSERT INTO [Staff].[InstructorDepartments] 
(
    InstructorID,
    FullName,
	DepartmentID,
	DepartmentName
)
SELECT	DISTINCT			  Instruct.InstructorID, 
					  O.Instructor, 
					  Dept.DepartmentID,
					  Dept.DepartmentName
					
	
FROM Uploadfile.NormalizedCourseOffering AS O INNER JOIN
	 Staff.Instructor AS Instruct ON Instruct.FullName = O.Instructor INNER JOIN
	 Staff.Department AS Dept ON Dept.DepartmentName = O.DepartmentName



    
END
GO
