SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Tahreem Ishfaq
-- Create date: 05/12/2022
-- Description:	
-- =============================================
CREATE PROCEDURE [Project3].[Load_Department]
AS
BEGIN
	ALTER SEQUENCE [Staff].[DepartmentKey] RESTART WITH 1
	SET NOCOUNT ON;
	
INSERT INTO [Staff].Department
(
	DepartmentID,
    DepartmentName,
	NumOfStaff
)

SELECT NEXT VALUE FOR [Staff].DepartmentKey, O.DepartmentName, COUNT(O.Instructor)
FROM (SELECT DISTINCT Instructor, DepartmentName  FROM Uploadfile.NormalizedCourseOffering) AS O
GROUP BY O.DepartmentName

END
GO
