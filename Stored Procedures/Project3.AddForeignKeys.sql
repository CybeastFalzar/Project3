SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:	
-- Create date: 05/13/2022
-- Description:	
-- =============================================

CREATE PROCEDURE [Project3].[AddForeignKeys] @UserAuthorizationKey AS INT
AS
BEGIN
    DECLARE @StartTime DATETIME2 = SYSDATETIME();

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    ALTER TABLE Courses.CourseClass
    ADD CONSTRAINT FK_CourseClass_Course
        FOREIGN KEY (CourseID)
        REFERENCES Courses.Course (CourseID);

    ALTER TABLE Courses.CourseClass
    ADD CONSTRAINT FK_CourseClass_Class
        FOREIGN KEY (Class)
        REFERENCES Courses.Class (Class);

    ALTER TABLE Courses.CourseClass
    ADD CONSTRAINT FK_CourseClass_ModeOfInstruction
        FOREIGN KEY (ModeOfInstruction)
        REFERENCES Courses.ModeOfInstruction (InstructionType);

    ALTER TABLE Location.BuildingRooms
    ADD CONSTRAINT FK_BuildingRooms_BuildingLocation
        FOREIGN KEY (BuildingName)
        REFERENCES Location.BuildingLocation (BuildingName);

    ALTER TABLE Location.BuildingRooms
    ADD CONSTRAINT FK_BuildingRooms_RoomLocation
        FOREIGN KEY (RoomNo)
        REFERENCES Location.RoomLocation (RoomNo);

    ALTER TABLE Courses.Course
    ADD CONSTRAINT FK_Course_Department
        FOREIGN KEY (Department)
        REFERENCES Staff.Department (DepartmentName);

    ALTER TABLE Staff.InstructorDepartments
    ADD CONSTRAINT FK_InstructorDepartments_Department
        FOREIGN KEY (DepartmentName)
        REFERENCES Staff.Department (DepartmentName);

    ALTER TABLE Staff.InstructorDepartments
    ADD CONSTRAINT FK_InstructorDepartments_Instructor
        FOREIGN KEY (InstructorID)
        REFERENCES Staff.Instructor (InstructorID);

    ALTER TABLE Courses.ClassBuilding
    ADD CONSTRAINT FK_ClassBuilding_Class
        FOREIGN KEY (Class)
        REFERENCES Courses.Class (Class);

    ALTER TABLE Courses.ClassBuilding
    ADD CONSTRAINT FK_ClassBuilding_BuildingLocation
        FOREIGN KEY (BuildingName)
        REFERENCES Location.BuildingLocation (BuildingName);

    ALTER TABLE Courses.ClassBuilding
    ADD CONSTRAINT FK_ClassBuilding_RoomLocation
        FOREIGN KEY (RoomNo)
        REFERENCES Location.RoomLocation (RoomNo);

    DECLARE @RowCount INT = 0;
    DECLARE @EndTime DATETIME2 = SYSDATETIME();
    EXEC Process.usp_TrackWorkFlow @UserAuthorizationKey = @UserAuthorizationKey,
                                   @WorkFlowStepDescription = N'Add Foreign Keys',
                                   @WorkFlowStepTableRowCount = @RowCount,
                                   @StartingDateTime = @StartTime,
                                   @EndingDateTime = @EndTime;




END;
GO
