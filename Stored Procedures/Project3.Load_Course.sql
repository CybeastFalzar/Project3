SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Project3].[Load_Course] @UserAuthorizationKey AS INT
AS
BEGIN
	DECLARE @StartTime DATETIME2 = SYSDATETIME();
    ALTER SEQUENCE [Courses].[CourseKey] RESTART WITH 1;
    SET NOCOUNT ON;


    INSERT INTO Courses.Course
    (
        CourseID,
        CourseName,
        Department,
        UserAuthorizationKey
    )
    SELECT NEXT VALUE FOR Courses.CourseKey,
           O.[Course (hr, crd)],
           O.DepartmentName,
           @UserAuthorizationKey
    FROM
    (
        SELECT DISTINCT
               [Course (hr, crd)],
               DepartmentName
        FROM Uploadfile.NormalizedCourseOffering
    ) AS O;

    DECLARE @RowCount INT =
            (
                SELECT COUNT(*)FROM Courses.Course
            );
    DECLARE @EndTime DATETIME2 = SYSDATETIME();
    EXEC Process.usp_TrackWorkFlow @UserAuthorizationKey = @UserAuthorizationKey,
                                   @WorkFlowStepDescription = N'Create the Course Table',
                                   @WorkFlowStepTableRowCount = @RowCount,
                                   @StartingDateTime = @StartTime,
                                   @EndingDateTime = @EndTime;

END;



GO
