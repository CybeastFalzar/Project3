SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Tahreem Ishfaq
-- Create date: 05/12/2022
-- Description:	
-- =============================================
CREATE PROCEDURE [Project3].[Load_InstructorDepartments] @UserAuthorizationKey AS INT
AS
BEGIN
    --ALTER SEQUENCE [Staff].[InstructorDepartmentsKey] RESTART WITH 1
    SET NOCOUNT ON;

    DECLARE @StartTime DATETIME2 = SYSDATETIME();
    INSERT INTO [Staff].[InstructorDepartments]
    (
        InstructorID,
        FullName,
        DepartmentID,
        DepartmentName,
		UserAuthorizationKey
    )
    SELECT DISTINCT
           Instruct.InstructorID,
           O.Instructor,
           Dept.DepartmentID,
           Dept.DepartmentName,
		   @UserAuthorizationKey
    FROM Uploadfile.NormalizedCourseOffering AS O
        INNER JOIN Staff.Instructor AS Instruct
            ON Instruct.FullName = O.Instructor
        INNER JOIN Staff.Department AS Dept
            ON Dept.DepartmentName = O.DepartmentName;

    DECLARE @RowCount INT =
            (
                SELECT COUNT(*) FROM [Staff].[InstructorDepartments]
            );
    DECLARE @EndTime DATETIME2 = SYSDATETIME();
    EXEC Process.usp_TrackWorkFlow @UserAuthorizationKey = @UserAuthorizationKey,
                                   @WorkFlowStepDescription = N'Create the InstructorDepartments Table',
                                   @WorkFlowStepTableRowCount = @RowCount,
                                   @StartingDateTime = @StartTime,
                                   @EndingDateTime = @EndTime;


END;
GO
