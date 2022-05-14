SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Videsh Narine
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [Project3].[TruncateDatabaseData]
	@UserAuthorizationKey int

AS
BEGIN
	DECLARE @StartTime DATETIME2 =SYSDATETIME();

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	TRUNCATE TABLE Courses.Course
	TRUNCATE TABLE Courses.Class
	TRUNCATE TABLE Courses.CourseClass
	TRUNCATE TABLE Courses.ModeOfInstruction
	TRUNCATE TABLE Location.BuildingLocation
	TRUNCATE TABLE Location.RoomLocation
	TRUNCATE TABLE Location.BuildingRooms
	TRUNCATE TABLE Staff.Department
	TRUNCATE TABLE Staff.Instructor
	TRUNCATE TABLE Staff.InstructorDepartments

	--TRUNCATE TABLE Process.WorkflowSteps


	 DECLARE @RowCount INT = 0;

         DECLARE @EndTime DATETIME2 =SYSDATETIME();

        EXEC Process.usp_TrackWorkFlow  @UserAuthorizationKey = @UserAuthorizationKey,
                                        @WorkFlowStepDescription=N'Truncates all of the data for each table ',
                                        @WorkFlowStepTableRowCount = @RowCount,
                                        @StartingDateTime =@StartTime,
                                        @EndingDateTime=@EndTime
end
GO
