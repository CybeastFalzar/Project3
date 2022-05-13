SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Lamyea Hoque, Saima Tarannum, 
--				Tahreem Ishfaq
-- Create date: 04/11/2022
-- Description:	Gets total execution time and
--				member execution time from 
--				WorkflowSteps table
-- =============================================
CREATE PROCEDURE [Process].[usp_TrackWorkFlow] 

	@WorkFlowStepDescription NVARCHAR (100),
	@WorkFlowStepTableRowCount INT,
	@StartingDateTime DATETIME2(7),
	@EndingDateTime DATETIME2(7),
	@UserAuthorizationKey INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	INSERT INTO [Process].[WorkflowSteps]
	(
		WorkFlowStepKey,
		WorkFlowStepDescription,
		WorkFlowStepTableRowCount,
		StartingDateTime,
		EndingDateTime,

		UserAuthorizationKey
		
	)

	VALUES (NEXT VALUE FOR Process.WorkflowStepsKey,
							@WorkFlowStepDescription,
							@WorkFlowStepTableRowCount,
							@StartingDateTime,
							@EndingDateTime,
							@UserAuthorizationKey);


END;
GO
