SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Project3].[Load_ModeOfInstruction] @UserAuthorizationKey AS INT
AS
BEGIN
	DECLARE @StartTime DATETIME2 = SYSDATETIME();
    SET NOCOUNT ON;
    INSERT INTO Courses.ModeOfInstruction
    (
        InstructionType,
		UserAuthorizationKey
    )
    SELECT DISTINCT
           [Mode of Instruction],
		   @UserAuthorizationKey
    FROM Uploadfile.NormalizedCourseOffering;

    DECLARE @RowCount INT =
            (
                SELECT COUNT(*) FROM Courses.ModeOfInstruction
            );
    DECLARE @EndTime DATETIME2 = SYSDATETIME();
    EXEC Process.usp_TrackWorkFlow @UserAuthorizationKey = @UserAuthorizationKey,
                                   @WorkFlowStepDescription = N'Create the ModeOfInstruction Table',
                                   @WorkFlowStepTableRowCount = @RowCount,
                                   @StartingDateTime = @StartTime,
                                   @EndingDateTime = @EndTime;


END;



GO
