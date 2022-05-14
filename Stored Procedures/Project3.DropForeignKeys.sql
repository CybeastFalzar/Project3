SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:	
-- Create date: 05/13/2022
-- Description:	
-- =============================================

CREATE PROCEDURE [Project3].[DropForeignKeys] @UserAuthorizationKey AS INT
AS
BEGIN
    DECLARE @StartTime DATETIME2 = SYSDATETIME();

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    ALTER TABLE Courses.CourseClass
    DROP CONSTRAINT IF EXISTS FK_CourseClass_Course, CONSTRAINT IF
                       EXISTS FK_CourseClass_Class, CONSTRAINT IF
                       EXISTS FK_CourseClass_ModeOfInstruction;

    ALTER TABLE Location.BuildingRooms
    DROP CONSTRAINT IF EXISTS FK_BuildingRooms_BuildingLocation, CONSTRAINT IF
                       EXISTS FK_BuildingRooms_RoomLocation;

    ALTER TABLE Courses.Course DROP CONSTRAINT IF EXISTS FK_Course_Department;

    ALTER TABLE Staff.InstructorDepartments
    DROP CONSTRAINT IF EXISTS FK_InstructorDepartments_Instructor, CONSTRAINT IF
                       EXISTS FK_InstructorDepartments_Department;



    DECLARE @RowCount INT = 0
    DECLARE @EndTime DATETIME2 = SYSDATETIME();
    EXEC Process.usp_TrackWorkFlow @UserAuthorizationKey = @UserAuthorizationKey,
                                   @WorkFlowStepDescription = N'Drop Foreign Keys',
                                   @WorkFlowStepTableRowCount = @RowCount,
                                   @StartingDateTime = @StartTime,
                                   @EndingDateTime = @EndTime;




END;
GO
