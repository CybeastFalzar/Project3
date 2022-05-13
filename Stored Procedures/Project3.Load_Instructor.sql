SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Project3].[Load_Instructor] @UserAuthorizationKey AS INT
AS
BEGIN
	DECLARE @StartTime DATETIME2 = SYSDATETIME();
    ALTER SEQUENCE [Staff].[InstructorKey] RESTART WITH 1;
    SET NOCOUNT ON;


    INSERT INTO [Staff].Instructor
    (
        InstructorID,
        FirstName,
        LastName,
        FullName,
		UserAuthorizationKey
    )
    SELECT NEXT VALUE FOR [Staff].InstructorKey,
           SUBSTRING(Instructor, CHARINDEX(',', Instructor) + 1, 20),
           TRIM(' ,' FROM (SUBSTRING(Instructor, 1, CHARINDEX(', ', Instructor) + 1))),
           X.Instructor,
		   @UserAuthorizationKey
    FROM
    (
        SELECT DISTINCT
               Instructor
        FROM Uploadfile.NormalizedCourseOffering
    ) AS X;

    DECLARE @RowCount INT =
            (
                SELECT COUNT(*) FROM [Staff].Instructor
            );
    DECLARE @EndTime DATETIME2 = SYSDATETIME();
    EXEC Process.usp_TrackWorkFlow @UserAuthorizationKey = @UserAuthorizationKey,
                                   @WorkFlowStepDescription = N'Create the Instructor Table',
                                   @WorkFlowStepTableRowCount = @RowCount,
                                   @StartingDateTime = @StartTime,
                                   @EndingDateTime = @EndTime;

END;



GO
