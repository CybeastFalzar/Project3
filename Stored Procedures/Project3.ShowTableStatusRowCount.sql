SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [Project3].[ShowTableStatusRowCount]  @UserAuthorizationKey AS INT,
@TableStatus VARCHAR(64)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  DECLARE @StartTime DATETIME2 =SYSDATETIME();

	INSERT INTO Project3.[RowCount] (
		TableStatus,
		TableName, 
		[RowCount]
	) 

	SELECT @TableStatus, 'Location.BuildingLocation', COUNT(*)
	FROM Location.BuildingLocation
	
	--
	INSERT INTO Project3.[RowCount] (
		TableStatus,
		TableName, 
		[RowCount]
	) 
	SELECT @TableStatus, 'Location.BuildingRooms', COUNT(*)
	FROM Location.BuildingRooms

	--
	INSERT INTO Project3.[RowCount] (
		TableStatus,
		TableName, 
		[RowCount]
	)
	SELECT @TableStatus, 'Courses.Class', COUNT(*)
	FROM Courses.Class

	--
	INSERT INTO Project3.[RowCount] (
		TableStatus,
		TableName, 
		[RowCount]
	)

	SELECT @TableStatus, 'Courses.Course', COUNT(*)
	FROM Courses.Course

	--


	--
	INSERT INTO Project3.[RowCount] (
		TableStatus,
		TableName, 
		[RowCount]
	) 
	SELECT @TableStatus, 'Staff.Department', COUNT(*)
	FROM Staff.Department


	--
	INSERT INTO Project3.[RowCount] (
		TableStatus,
		TableName, 
		[RowCount]
	) 
	SELECT @TableStatus, 'Staff.Instructor', COUNT(*)
	FROM Staff.Instructor

	--
	INSERT INTO Project3.[RowCount] (
		TableStatus,
		TableName, 
		[RowCount]
	)  
	SELECT @TableStatus, 'Staff.InstructorDepartments', COUNT(*)
	FROM Staff.InstructorDepartments

		--
	INSERT INTO Project3.[RowCount] (
		TableStatus,
		TableName, 
		[RowCount]
	) 
	SELECT @TableStatus, 'Courses.ModeOfInstruction', COUNT(*)
	FROM Courses.ModeOfInstruction

		--
	INSERT INTO Project3.[RowCount] (
		TableStatus,
		TableName, 
		[RowCount]
	)  
	SELECT @TableStatus, 'Location.RoomLocation', COUNT(*)
	FROM Location.RoomLocation


		INSERT INTO Project3.[RowCount] (
		TableStatus,
		TableName, 
		[RowCount]
	)
	SELECT @TableStatus, 'Courses.CourseClass', COUNT(*)
	FROM Courses.CourseClass

	INSERT INTO Project3.[RowCount] (
		TableStatus,
		TableName, 
		[RowCount]
	)
	SELECT @TableStatus, 'Courses.ClassBuilding', COUNT(*)
	FROM Courses.ClassBuilding
	
   		 DECLARE @RowCount INT = (SELECT COUNT(*) FROM Project3.[RowCount]);

         DECLARE @EndTime DATETIME2 =SYSDATETIME();

        EXEC Process.usp_TrackWorkFlow  @UserAuthorizationKey = @UserAuthorizationKey,
                                        @WorkFlowStepDescription=N'Load in the RowCount table from the Database ',
                                        @WorkFlowStepTableRowCount = @RowCount,
                                        @StartingDateTime =@StartTime,
                                        @EndingDateTime=@EndTime

END
GO
