SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Project3].[Load_Class] @UserAuthorizationKey AS INT
AS
BEGIN
	 DECLARE @StartTime DATETIME2 = SYSDATETIME();
	SET NOCOUNT ON;
	ALTER SEQUENCE Courses.ClassKey RESTART WITH 1

	INSERT INTO Courses.Class
	(
	    ClassID,
	    Class,
		NumberOfClasses,
		UserAuthorizationKey
	)
	
	SELECT NEXT VALUE FOR Courses.ClassKey, O.[Description], COUNT(*), @UserAuthorizationKey
	FROM Uploadfile.NormalizedCourseOffering AS O
	--WHERE O.Description = 'Conceptual Physics Lab'
	GROUP BY O.[Description]
	
    DECLARE @RowCount INT =
            (
                SELECT COUNT(*) FROM Courses.Class
            );
    DECLARE @EndTime DATETIME2 = SYSDATETIME();
    EXEC Process.usp_TrackWorkFlow @UserAuthorizationKey = @UserAuthorizationKey,
                                   @WorkFlowStepDescription = N'Create the Class Table',
                                   @WorkFlowStepTableRowCount = @RowCount,
                                   @StartingDateTime = @StartTime,
                                   @EndingDateTime = @EndTime;



END



GO
