USE [WinMonitor_Database]
GO
/****** Object:  Table [dbo].[DBCompany]    Script Date: 19-02-2016 12:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBCompany](
	[DBCompanyId] [varchar](50) NOT NULL,
	[DBCompanyName] [varchar](50) NULL,
	[DBURL] [varchar](50) NULL,
 CONSTRAINT [CPK] PRIMARY KEY CLUSTERED 
(
	[DBCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBComponent_With_Status]    Script Date: 19-02-2016 12:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBComponent_With_Status](
	[DBCSId] [varchar](50) NOT NULL,
	[DBComponentName] [varchar](50) NULL,
	[DBStatus] [varchar](50) NULL,
	[DBType] [varchar](50) NULL,
	[DBCompanyId] [varchar](50) NULL,
 CONSTRAINT [CWSPK] PRIMARY KEY CLUSTERED 
(
	[DBCSId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBIncidents]    Script Date: 19-02-2016 12:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBIncidents](
	[DBIncidentId] [varchar](50) NOT NULL,
	[DBName] [varchar](50) NULL,
	[DBCSId] [varchar](50) NULL,
	[DBDescription] [varchar](200) NULL,
 CONSTRAINT [IPK] PRIMARY KEY CLUSTERED 
(
	[DBIncidentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBLogin]    Script Date: 19-02-2016 12:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBLogin](
	[DBUsername] [varchar](50) NOT NULL,
	[DBPassword] [varchar](50) NULL,
 CONSTRAINT [LPK] PRIMARY KEY CLUSTERED 
(
	[DBUsername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBSubscriptions]    Script Date: 19-02-2016 12:02:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBSubscriptions](
	[DBId] [varchar](50) NOT NULL,
	[DBName] [varchar](50) NULL,
	[DBEmail] [varchar](50) NULL,
	[DBPhone] [varchar](50) NULL,
	[DBType] [varchar](50) NULL,
 CONSTRAINT [SPK] PRIMARY KEY CLUSTERED 
(
	[DBId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [CUN]    Script Date: 19-02-2016 12:02:19 ******/
ALTER TABLE [dbo].[DBCompany] ADD  CONSTRAINT [CUN] UNIQUE NONCLUSTERED 
(
	[DBURL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DBComponent_With_Status]  WITH CHECK ADD FOREIGN KEY([DBCompanyId])
REFERENCES [dbo].[DBCompany] ([DBCompanyId])
GO
ALTER TABLE [dbo].[DBIncidents]  WITH CHECK ADD FOREIGN KEY([DBCSId])
REFERENCES [dbo].[DBComponent_With_Status] ([DBCSId])
GO
ALTER TABLE [dbo].[DBComponent_With_Status]  WITH CHECK ADD  CONSTRAINT [CWSCHKStatus] CHECK  (([DBStatus]='Major' OR [DBStatus]='Minor' OR [DBStatus]='Operational'))
GO
ALTER TABLE [dbo].[DBComponent_With_Status] CHECK CONSTRAINT [CWSCHKStatus]
GO
ALTER TABLE [dbo].[DBComponent_With_Status]  WITH CHECK ADD  CONSTRAINT [CWSCHKType] CHECK  (([DBType]='Specific' OR [DBType]='Main'))
GO
ALTER TABLE [dbo].[DBComponent_With_Status] CHECK CONSTRAINT [CWSCHKType]
GO
ALTER TABLE [dbo].[DBSubscriptions]  WITH CHECK ADD  CONSTRAINT [SCHKType] CHECK  (([DBType]='Email' OR [DBType]='SMS'))
GO
ALTER TABLE [dbo].[DBSubscriptions] CHECK CONSTRAINT [SCHKType]
GO
