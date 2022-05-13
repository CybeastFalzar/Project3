SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Tahreem Ishfaq
-- Create date: 05/12/2022
-- Description:	
-- =============================================
CREATE PROCEDURE [Project3].[Load_Department] @UserAuthorizationKey AS INT
AS
BEGIN
	DECLARE @StartTime DATETIME2 = SYSDATETIME();
    ALTER SEQUENCE [Staff].[DepartmentKey] RESTART WITH 1;
    SET NOCOUNT ON;

    INSERT INTO [Staff].Department
    (
        DepartmentID,
        DepartmentName,
        NumOfStaff,
		UserAuthorizationKey
    )
    SELECT NEXT VALUE FOR [Staff].DepartmentKey,
           O.DepartmentName,
           COUNT(O.Instructor),
		   @UserAuthorizationKey
    FROM
    (
        SELECT DISTINCT
               Instructor,
               DepartmentName
        FROM Uploadfile.NormalizedCourseOffering
    ) AS O
    GROUP BY O.DepartmentName;
	
    DECLARE @RowCount INT =
            (
                SELECT COUNT(*) FROM [Staff].Department
            );
    DECLARE @EndTime DATETIME2 = SYSDATETIME();
    EXEC Process.usp_TrackWorkFlow @UserAuthorizationKey = @UserAuthorizationKey,
                                   @WorkFlowStepDescription = N'Create the Department Table',
                                   @WorkFlowStepTableRowCount = @RowCount,
                                   @StartingDateTime = @StartTime,
                                   @EndingDateTime = @EndTime;


END;
GO
