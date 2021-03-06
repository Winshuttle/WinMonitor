/****** Object:  User [WinMonitor_Login]    Script Date: 6/16/2016 5:18:17 PM ******/
CREATE USER [WinMonitor_Login] FOR LOGIN [WinMonitor_Login] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Help]    Script Date: 6/16/2016 5:18:17 PM ******/
CREATE USER [Help] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'WinMonitor_Login'
GO
/****** Object:  StoredProcedure [dbo].[GetDateDiffInSec]    Script Date: 6/16/2016 5:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDateDiffInSec]
    -- Add the parameters for the stored procedure here
    @StartTime DateTime2,
	@EndTime DateTime2 

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for procedure here
select DATEDIFF(s, @StartTime, @EndTime)
END
GO
/****** Object:  Table [dbo].[DBCalendar]    Script Date: 6/16/2016 5:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBCalendar](
	[DBEventId] [int] NOT NULL,
	[DBEventTitle] [varchar](50) NOT NULL,
	[DBEventDetails] [varchar](200) NULL,
	[DBEventStartTime] [datetime2](7) NOT NULL,
	[DBEventEndTime] [datetime2](7) NOT NULL,
	[DBEventDifferenceTime] [varchar](50) NULL,
	[DBEventMaintenance] [varchar](50) NULL,
	[DBEventStatus] [varchar](50) NULL,
	[DBCompanyId] [int] NULL,
 CONSTRAINT [CalPK] PRIMARY KEY CLUSTERED 
(
	[DBEventId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[DBCompany]    Script Date: 6/16/2016 5:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBCompany](
	[DBCompanyId] [int] NOT NULL,
	[DBCompanyName] [varchar](50) NULL,
	[DBURL] [varchar](200) NULL,
	[DBPrimaryCenter] [varchar](50) NULL,
	[DBSecondaryCenter] [varchar](50) NULL,
 CONSTRAINT [CPK] PRIMARY KEY CLUSTERED 
(
	[DBCompanyId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF),
 CONSTRAINT [CUN] UNIQUE NONCLUSTERED 
(
	[DBURL] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF),
 CONSTRAINT [CUNN] UNIQUE NONCLUSTERED 
(
	[DBCompanyName] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[DBComponent_With_Status]    Script Date: 6/16/2016 5:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBComponent_With_Status](
	[DBCSId] [int] NOT NULL,
	[DBComponentName] [varchar](50) NULL,
	[DBStatus] [varchar](50) NULL,
	[DBType] [varchar](50) NULL,
	[DBCompanyId] [int] NULL,
	[DBMasterComponentName] [varchar](50) NULL,
	[DBCenterName] [varchar](50) NULL,
 CONSTRAINT [CWSPK] PRIMARY KEY CLUSTERED 
(
	[DBCSId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[DBDataCenter]    Script Date: 6/16/2016 5:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBDataCenter](
	[DBDataCenterId] [int] NOT NULL,
	[DBDataCenterName] [varchar](50) NULL,
	[DBTypeName] [varchar](50) NULL,
 CONSTRAINT [DCPK] PRIMARY KEY CLUSTERED 
(
	[DBDataCenterId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[DBEmailPages]    Script Date: 6/16/2016 5:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBEmailPages](
	[DBEmailPageId] [int] NOT NULL,
	[DBEmailPageName] [varchar](50) NULL,
	[DBEmailContent] [varchar](max) NULL,
 CONSTRAINT [EPK] PRIMARY KEY CLUSTERED 
(
	[DBEmailPageId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[DBIncidents]    Script Date: 6/16/2016 5:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBIncidents](
	[DBIncidentId] [int] NOT NULL,
	[DBIncidentName] [varchar](50) NULL,
	[DBCSId] [int] NULL,
	[DBDescription] [varchar](200) NULL,
	[DBExpectedDuration] [int] NULL,
 CONSTRAINT [IPK] PRIMARY KEY CLUSTERED 
(
	[DBIncidentId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[DBLogHistory]    Script Date: 6/16/2016 5:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBLogHistory](
	[DBLogId] [int] NOT NULL,
	[DBCompanyId] [int] NULL,
	[DBCSId] [int] NULL,
	[DBIncidentId] [int] NULL,
	[DBComponentName] [varchar](50) NULL,
	[DBIncidentName] [varchar](50) NULL,
	[DBIncidentDetails] [varchar](200) NULL,
	[DBDateTimeStart] [datetime2](7) NULL,
	[DBStatus] [varchar](50) NULL,
	[DBDateTimeEnd] [datetime2](7) NULL,
 CONSTRAINT [LogPK] PRIMARY KEY CLUSTERED 
(
	[DBLogId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[DBLogin]    Script Date: 6/16/2016 5:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBLogin](
	[DBUsername] [varchar](50) NOT NULL,
	[DBPassword] [varchar](50) NULL,
	[DBAccountType] [varchar](50) NULL,
 CONSTRAINT [LPK] PRIMARY KEY CLUSTERED 
(
	[DBUsername] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[DBMaster_DBComponent_With_Status]    Script Date: 6/16/2016 5:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBMaster_DBComponent_With_Status](
	[DBMasterComponentName] [varchar](50) NOT NULL,
 CONSTRAINT [MPK] PRIMARY KEY CLUSTERED 
(
	[DBMasterComponentName] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[DBSubscriptions]    Script Date: 6/16/2016 5:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBSubscriptions](
	[DBSubscriptionsId] [int] NOT NULL,
	[DBName] [varchar](50) NULL,
	[DBEmail] [varchar](50) NULL,
	[DBCompanyId] [int] NULL,
 CONSTRAINT [SPK] PRIMARY KEY CLUSTERED 
(
	[DBSubscriptionsId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[UserTokenCaches]    Script Date: 6/16/2016 5:18:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTokenCaches](
	[UserTokenCacheId] [int] IDENTITY(1,1) NOT NULL,
	[webUserUniqueId] [nvarchar](max) NULL,
	[cacheBits] [varbinary](max) NULL,
	[LastWrite] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.UserTokenCaches] PRIMARY KEY CLUSTERED 
(
	[UserTokenCacheId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
ALTER TABLE [dbo].[DBIncidents] ADD  CONSTRAINT [defConsForExpectedDuration]  DEFAULT (NULL) FOR [DBExpectedDuration]
GO
ALTER TABLE [dbo].[DBCalendar]  WITH CHECK ADD FOREIGN KEY([DBCompanyId])
REFERENCES [dbo].[DBCompany] ([DBCompanyId])
GO
ALTER TABLE [dbo].[DBComponent_With_Status]  WITH CHECK ADD  CONSTRAINT [FK__DBCompone__DBCom__4865BE2A] FOREIGN KEY([DBCompanyId])
REFERENCES [dbo].[DBCompany] ([DBCompanyId])
GO
ALTER TABLE [dbo].[DBComponent_With_Status] CHECK CONSTRAINT [FK__DBCompone__DBCom__4865BE2A]
GO
ALTER TABLE [dbo].[DBComponent_With_Status]  WITH CHECK ADD FOREIGN KEY([DBMasterComponentName])
REFERENCES [dbo].[DBMaster_DBComponent_With_Status] ([DBMasterComponentName])
GO
ALTER TABLE [dbo].[DBIncidents]  WITH CHECK ADD FOREIGN KEY([DBCSId])
REFERENCES [dbo].[DBComponent_With_Status] ([DBCSId])
GO
ALTER TABLE [dbo].[DBSubscriptions]  WITH CHECK ADD FOREIGN KEY([DBCompanyId])
REFERENCES [dbo].[DBCompany] ([DBCompanyId])
GO
ALTER TABLE [dbo].[DBCalendar]  WITH CHECK ADD  CONSTRAINT [CalCHKEventMaintenance] CHECK  (([DBEventMaintenance]='Updates' OR [DBEventMaintenance]='Maintenance'))
GO
ALTER TABLE [dbo].[DBCalendar] CHECK CONSTRAINT [CalCHKEventMaintenance]
GO
ALTER TABLE [dbo].[DBCalendar]  WITH CHECK ADD  CONSTRAINT [CalCHKEventStatus] CHECK  (([DBEventStatus]='Inactive' OR [DBEventStatus]='Active'))
GO
ALTER TABLE [dbo].[DBCalendar] CHECK CONSTRAINT [CalCHKEventStatus]
GO
ALTER TABLE [dbo].[DBComponent_With_Status]  WITH CHECK ADD  CONSTRAINT [CWSCHKStatus] CHECK  (([DBStatus]='Service Disruption' OR [DBStatus]='Performance Degradation' OR [DBStatus]='Operational'))
GO
ALTER TABLE [dbo].[DBComponent_With_Status] CHECK CONSTRAINT [CWSCHKStatus]
GO
ALTER TABLE [dbo].[DBComponent_With_Status]  WITH CHECK ADD  CONSTRAINT [CWSCHKType] CHECK  (([DBType]='Specific' OR [DBType]='Master'))
GO
ALTER TABLE [dbo].[DBComponent_With_Status] CHECK CONSTRAINT [CWSCHKType]
GO
ALTER TABLE [dbo].[DBDataCenter]  WITH CHECK ADD  CONSTRAINT [DCHKTypeName] CHECK  (([DBTypeName]='secondary' OR [DBTypeName]='primary'))
GO
ALTER TABLE [dbo].[DBDataCenter] CHECK CONSTRAINT [DCHKTypeName]
GO
ALTER TABLE [dbo].[DBLogin]  WITH CHECK ADD  CONSTRAINT [LCHKAccountType] CHECK  (([DBAccountType]='Edit'))
GO
ALTER TABLE [dbo].[DBLogin] CHECK CONSTRAINT [LCHKAccountType]
GO
