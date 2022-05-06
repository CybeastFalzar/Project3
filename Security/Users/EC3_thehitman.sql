IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'EC3\thehitman')
CREATE LOGIN [EC3\thehitman] FROM WINDOWS
GO
CREATE USER [EC3\thehitman] FOR LOGIN [EC3\thehitman]
GO
