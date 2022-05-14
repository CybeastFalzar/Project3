SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:    
-- Create date: 
-- Description:    
-- =============================================
CREATE PROCEDURE [Project3].[LoadProject]  @UserAuthorizationKey AS INT
    -- Add the parameters for the stored procedure here
AS
BEGIN

DECLARE @StartTime DATETIME2 =SYSDATETIME();

    SET NOCOUNT ON;
        ALTER SEQUENCE Process.WorkflowStepsKey RESTART WITH 1 
        TRUNCATE TABLE Process.WorkflowSteps
    --    Drop All of the foreign keys prior to truncating tables in the star schema
     --
    EXEC Project3.DropForeignKeys @UserAuthorizationKey = 4 -- int
    --    
    --    Check row count before truncation
    EXEC    Project3.ShowTableStatusRowCount
        @UserAuthorizationKey = 1,
        @TableStatus = N'''Pre-truncate of tables''';
    --
    --    Always truncate the Star Schema Data
    --
    EXEC  [Project3].[TruncateDatabaseData]
        @UserAuthorizationKey = 1;
    --    
    --    Load the star schema
    --
		EXEC Project3.Load_Department @UserAuthorizationKey = 2 -- int
		EXEC Project3.Load_Class @UserAuthorizationKey = 1 -- int
		EXEC Project3.Load_Course @UserAuthorizationKey = 1 -- int
		EXEC Project3.Load_ModeOfInstruction @UserAuthorizationKey = 4 -- int
		EXEC Project3.Load_BuildingLocation @UserAuthorizationKey = 3 -- int
		EXEC Project3.Load_RoomLocation @UserAuthorizationKey = 3 -- int
		EXEC Project3.Load_BuildingRooms @UserAuthorizationKey = 3 -- int
		EXEC Project3.Load_Instructor @UserAuthorizationKey = 2 -- int
		EXEC Project3.Load_InstructorDepartments @UserAuthorizationKey = 2 -- int
		EXEC Project3.Load_CourseClass @UserAuthorizationKey = 1 -- int

		
		
  --
    --    Recreate all of the foreign keys prior after loading the star schema
    --
     --
    --    Check row count before truncation
    EXEC    Project3.ShowTableStatusRowCount
        --@GroupMemberUserAuthorizationKey = 1,  -- Change -1 to the appropriate UserAuthorizationKey
        @UserAuthorizationKey = 1,
        @TableStatus = N'''Row Count after loading the star schema'''
    SELECT * FROM Project3.[RowCount]
    --
   EXEC [Project3].[AddForeignKeys]   -- Change -1 to the appropriate UserAuthorizationKey
        @UserAuthorizationKey = 1;
       TRUNCATE TABLE Project3.[RowCount]
    --

    DECLARE @EndTime DATETIME2 =SYSDATETIME();

    
    EXEC Process.usp_TrackWorkFlow  @UserAuthorizationKey = @UserAuthorizationKey,
                                    @WorkFlowStepDescription=N'Load the Database',
                                    @WorkFlowStepTableRowCount = 0,
                                    @StartingDateTime =@StartTime,
                                    @EndingDateTime=@EndTime

END;
GO
