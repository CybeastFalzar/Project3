SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:	Lamyea Hoque
-- Create date: 05/12/2022
-- Description:	
-- =============================================

CREATE PROCEDURE [Project3].[Load_RoomLocation]
AS
BEGIN


    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    INSERT INTO Location.RoomLocation
    (
        RoomNo
    )
    SELECT DISTINCT TRIM(SUBSTRING(Location, 4, 100))
    FROM Uploadfile.NormalizedCourseOffering
    WHERE Location != 'TBA';
	
END;
GO
