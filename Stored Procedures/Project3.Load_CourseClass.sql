SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Project3].[Load_CourseClass] @UserAuthorizationKey AS INT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @StartTime DATETIME2 = SYSDATETIME();
    INSERT INTO Courses.CourseClass
    (
        CourseID,
        CourseName,
        Class,
        SectionNo,
        ModeOfInstruction,
		UserAuthorizationKey
    )
    SELECT C.CourseID,
           C.CourseName,
           CL.Class,
           NCO.Sec,
           M.InstructionType,
		   @UserAuthorizationKey
    FROM Uploadfile.NormalizedCourseOffering AS NCO
        INNER JOIN Courses.Course AS C
            ON C.CourseName = NCO.[Course (hr, crd)]
        INNER JOIN Courses.Class AS CL
            ON CL.Class = NCO.Description
        INNER JOIN Courses.ModeOfInstruction AS M
            ON M.InstructionType = NCO.[Mode of Instruction];


    DECLARE @RowCount INT =
            (
                SELECT COUNT(*) FROM Courses.CourseClass
            );
    DECLARE @EndTime DATETIME2 = SYSDATETIME();
    EXEC Process.usp_TrackWorkFlow @UserAuthorizationKey = @UserAuthorizationKey,
                                   @WorkFlowStepDescription = N'Create the CourseClass Table',
                                   @WorkFlowStepTableRowCount = @RowCount,
                                   @StartingDateTime = @StartTime,
                                   @EndingDateTime = @EndTime;


END;



GO
