CREATE TABLE [Process].[WorkflowSteps]
(
[WorkFlowStepKey] [int] NOT NULL,
[WorkFlowStepDescription] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[WorkFlowStepTableRowCount] [int] NULL CONSTRAINT [DF_Process.WorkflowSteps_WorkFlowStepTableRowCount] DEFAULT ((0)),
[StartingDateTime] [datetime2] NULL CONSTRAINT [DF_Process.WorkflowSteps_StartingDateTime] DEFAULT (sysdatetime()),
[EndingDateTime] [datetime2] NULL CONSTRAINT [DF_Process.WorkflowSteps_EndingDateTime] DEFAULT (sysdatetime()),
[ClassTime] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Process.WorkflowSteps_ClassTime] DEFAULT (N'9:15'),
[UserAuthorizationKey] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
