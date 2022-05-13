SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:	Lamyea Hoque
-- Create date: 05/12/2022
-- Description:	
-- =============================================

CREATE PROCEDURE [Project3].[Load_BuildingRooms]
AS
BEGIN


    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    INSERT INTO Location.BuildingRooms
    (
        BuildingName,
        RoomNo
    )
    SELECT DISTINCT
           SUBSTRING(Location, 1, 2),
           TRIM(SUBSTRING(Location, 4, 4))
    FROM Uploadfile.NormalizedCourseOffering AS NCO
        INNER JOIN Location.BuildingLocation AS BL
            ON BL.BuildingName = SUBSTRING(Location, 1, 2)
        INNER JOIN Location.RoomLocation AS RL
            ON RL.RoomNo = TRIM(SUBSTRING(Location, 4, 4))
    WHERE Location != 'TBA';

END;
GO
