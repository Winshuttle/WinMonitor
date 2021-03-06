USE [WinMonitor_Database]
GO
/****** Object:  StoredProcedure [dbo].[GetDateDiffInSec]    Script Date: 23-05-2016 14:41:19 ******/
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
/****** Object:  Table [dbo].[DBCalendar]    Script Date: 23-05-2016 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBCompany]    Script Date: 23-05-2016 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBComponent_With_Status]    Script Date: 23-05-2016 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBDataCenter]    Script Date: 23-05-2016 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBDataCenter](
	[DBDataCenterId] [int] NOT NULL,
	[DBDataCenterName] [varchar](50) NULL,
	[DBTypeName] [varchar](50) NULL,
 CONSTRAINT [DCPK] PRIMARY KEY CLUSTERED 
(
	[DBDataCenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBEmailPages]    Script Date: 23-05-2016 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBEmailPages](
	[DBEmailPageId] [int] NOT NULL,
	[DBEmailPageName] [varchar](50) NULL,
	[DBEmailContent] [varchar](max) NULL,
 CONSTRAINT [EPK] PRIMARY KEY CLUSTERED 
(
	[DBEmailPageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBIncidents]    Script Date: 23-05-2016 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBIncidents](
	[DBIncidentId] [int] NOT NULL,
	[DBIncidentName] [varchar](50) NULL,
	[DBCSId] [int] NULL,
	[DBDescription] [varchar](200) NULL,
 CONSTRAINT [IPK] PRIMARY KEY CLUSTERED 
(
	[DBIncidentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBLogHistory]    Script Date: 23-05-2016 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBLogin]    Script Date: 23-05-2016 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBLogin](
	[DBUsername] [varchar](50) NOT NULL,
	[DBPassword] [varchar](50) NULL,
	[DBAccountType] [varchar](50) NULL,
 CONSTRAINT [LPK] PRIMARY KEY CLUSTERED 
(
	[DBUsername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBMaster_DBComponent_With_Status]    Script Date: 23-05-2016 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBMaster_DBComponent_With_Status](
	[DBMasterComponentName] [varchar](50) NOT NULL,
 CONSTRAINT [MPK] PRIMARY KEY CLUSTERED 
(
	[DBMasterComponentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBSubscriptions]    Script Date: 23-05-2016 14:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBSubscriptions](
	[DBSubscriptionsId] [int] NOT NULL,
	[DBName] [varchar](50) NULL,
	[DBEmail] [varchar](50) NULL,
	[DBCompanyId] [int] NULL,
 CONSTRAINT [SPK] PRIMARY KEY CLUSTERED 
(
	[DBSubscriptionsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DBCalendar] ([DBEventId], [DBEventTitle], [DBEventDetails], [DBEventStartTime], [DBEventEndTime], [DBEventDifferenceTime], [DBEventMaintenance], [DBEventStatus], [DBCompanyId]) VALUES (63, N'testEvent', N'testEvent', CAST(0x07007CDB2771653B0B AS DateTime2), CAST(0x0700B0BD5875683B0B AS DateTime2), N'00:30:00', N'Maintenance', N'Inactive', 45)
INSERT [dbo].[DBCalendar] ([DBEventId], [DBEventTitle], [DBEventDetails], [DBEventStartTime], [DBEventEndTime], [DBEventDifferenceTime], [DBEventMaintenance], [DBEventStatus], [DBCompanyId]) VALUES (65, N'testEventForAll', N'testEventForAll', CAST(0x0700E49F8979653B0B AS DateTime2), CAST(0x07001882BA7D663B0B AS DateTime2), N'00:30:00', N'Maintenance', N'Inactive', 45)
INSERT [dbo].[DBCalendar] ([DBEventId], [DBEventTitle], [DBEventDetails], [DBEventStartTime], [DBEventEndTime], [DBEventDifferenceTime], [DBEventMaintenance], [DBEventStatus], [DBCompanyId]) VALUES (66, N'testEventForAll', N'testEventForAll', CAST(0x0700E49F8979653B0B AS DateTime2), CAST(0x07001882BA7D653B0B AS DateTime2), N'00:30:00', N'Maintenance', N'Inactive', 46)
INSERT [dbo].[DBCalendar] ([DBEventId], [DBEventTitle], [DBEventDetails], [DBEventStartTime], [DBEventEndTime], [DBEventDifferenceTime], [DBEventMaintenance], [DBEventStatus], [DBCompanyId]) VALUES (69, N'testEvent2', N'testEvent2', CAST(0x07007CDB2771663B0B AS DateTime2), CAST(0x0700B0BD5875673B0B AS DateTime2), N'00:30:00', N'Updates', N'Inactive', 45)
INSERT [dbo].[DBCompany] ([DBCompanyId], [DBCompanyName], [DBURL], [DBPrimaryCenter], [DBSecondaryCenter]) VALUES (45, N'Nike', N'http://nike.com', N'DC-US', N'DC-UK')
INSERT [dbo].[DBCompany] ([DBCompanyId], [DBCompanyName], [DBURL], [DBPrimaryCenter], [DBSecondaryCenter]) VALUES (46, N'Oracle', N'http://oracle.com', N'DC-SA', N'DC-NK')
INSERT [dbo].[DBComponent_With_Status] ([DBCSId], [DBComponentName], [DBStatus], [DBType], [DBCompanyId], [DBMasterComponentName], [DBCenterName]) VALUES (39, N'Database', N'Operational', N'master', 45, N'Database', N'DC-US')
INSERT [dbo].[DBComponent_With_Status] ([DBCSId], [DBComponentName], [DBStatus], [DBType], [DBCompanyId], [DBMasterComponentName], [DBCenterName]) VALUES (40, N'Emails', N'Operational', N'master', 45, N'Emails', N'DC-US')
INSERT [dbo].[DBComponent_With_Status] ([DBCSId], [DBComponentName], [DBStatus], [DBType], [DBCompanyId], [DBMasterComponentName], [DBCenterName]) VALUES (41, N'Service-Bus', N'Operational', N'master', 45, N'Service-Bus', N'DC-US')
INSERT [dbo].[DBComponent_With_Status] ([DBCSId], [DBComponentName], [DBStatus], [DBType], [DBCompanyId], [DBMasterComponentName], [DBCenterName]) VALUES (42, N'SVService', N'Operational', N'master', 45, N'SVService', N'DC-US')
INSERT [dbo].[DBComponent_With_Status] ([DBCSId], [DBComponentName], [DBStatus], [DBType], [DBCompanyId], [DBMasterComponentName], [DBCenterName]) VALUES (43, N'User-Profiles', N'Operational', N'master', 45, N'User-Profiles', N'DC-US')
INSERT [dbo].[DBComponent_With_Status] ([DBCSId], [DBComponentName], [DBStatus], [DBType], [DBCompanyId], [DBMasterComponentName], [DBCenterName]) VALUES (44, N'Database', N'Operational', N'master', 46, N'Database', N'DC-SA')
INSERT [dbo].[DBComponent_With_Status] ([DBCSId], [DBComponentName], [DBStatus], [DBType], [DBCompanyId], [DBMasterComponentName], [DBCenterName]) VALUES (45, N'Emails', N'Operational', N'master', 46, N'Emails', N'DC-SA')
INSERT [dbo].[DBComponent_With_Status] ([DBCSId], [DBComponentName], [DBStatus], [DBType], [DBCompanyId], [DBMasterComponentName], [DBCenterName]) VALUES (46, N'Service-Bus', N'Operational', N'master', 46, N'Service-Bus', N'DC-SA')
INSERT [dbo].[DBComponent_With_Status] ([DBCSId], [DBComponentName], [DBStatus], [DBType], [DBCompanyId], [DBMasterComponentName], [DBCenterName]) VALUES (47, N'SVService', N'Operational', N'master', 46, N'SVService', N'DC-SA')
INSERT [dbo].[DBComponent_With_Status] ([DBCSId], [DBComponentName], [DBStatus], [DBType], [DBCompanyId], [DBMasterComponentName], [DBCenterName]) VALUES (48, N'User-Profiles', N'Operational', N'master', 46, N'User-Profiles', N'DC-SA')
INSERT [dbo].[DBDataCenter] ([DBDataCenterId], [DBDataCenterName], [DBTypeName]) VALUES (42, N'DC-US', N'primary')
INSERT [dbo].[DBDataCenter] ([DBDataCenterId], [DBDataCenterName], [DBTypeName]) VALUES (43, N'DC-SA', N'primary')
INSERT [dbo].[DBDataCenter] ([DBDataCenterId], [DBDataCenterName], [DBTypeName]) VALUES (44, N'DC-LA', N'primary')
INSERT [dbo].[DBDataCenter] ([DBDataCenterId], [DBDataCenterName], [DBTypeName]) VALUES (45, N'DC-NA', N'primary')
INSERT [dbo].[DBDataCenter] ([DBDataCenterId], [DBDataCenterName], [DBTypeName]) VALUES (46, N'DC-UK', N'secondary')
INSERT [dbo].[DBDataCenter] ([DBDataCenterId], [DBDataCenterName], [DBTypeName]) VALUES (47, N'DC-NK', N'secondary')
INSERT [dbo].[DBDataCenter] ([DBDataCenterId], [DBDataCenterName], [DBTypeName]) VALUES (48, N'DC-SK', N'secondary')
INSERT [dbo].[DBEmailPages] ([DBEmailPageId], [DBEmailPageName], [DBEmailContent]) VALUES (1, N'EmailOnComponentDataCenterUpdate', N'<html>
    <head>
    <title>WinMonitor Notification</title>
    </head>
    <body>
        <center>
            <div style="height:100%;width:50%; background-color:white;">
                <center>
                    <div style="width:70%;height:100%">
                        <div id="header">
                        <h1><span style="color:#0067BB;">WinMonitor</span> Application Update</h1>
    
                            <h2 style="width:100%; text-align:left">Hi customerNameVariable,</h2>
                        </div>
                        <div id="divForEvents">
                            <span style="font-weight:bolder;font-size:larger">Maintenance Events</span>
                                    
                            <p style="float:left; width:100%;">Following event has been scheduled.</p>
                            <div id="detailsOfEvents">
                                <table>
                                    <tr>
                                        <td>
                                            <label for="eventNameTextFeild">Event Name:</label>
                                        </td>
                                        <td>
                                            <input type="text" id="eventNameTextFeild" readonly="readonly" style="border: none;" value="EventNameVariable"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="eventDetailsTextFeild">Event Details:</label>
                                        </td>
                                        <td>
                                            <textArea id="eventDetailsTextFeild" readonly="readonly" style="border: none;">EventDetailsVariable</textArea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="eventStartTimeTextFeild">Event Start:</label>
                                        </td>
                                        <td>
                                            <input type="text" id="eventStartTimeTextFeild" readonly="readonly" style="border: none;" value="EventStartTimeVariable"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="eventEndTimeTextFeild">Event End:</label>
                                        </td>
                                        <td>
                                            <input type="text" id="eventEndTimeTextFeild" readonly="readonly" style="border: none;" value="EventEndTimeVariable"/>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!--end of eventsUpdateDiv-->
                        <br /><br /><br /><br />

                        <div id="divForComponentUpdates">
                            <span style="font-weight:bolder;font-size:larger">Components Changes and Updates</span>
                            <div id="divForComponentStatusUpdate">
                                <p style="float:left; width:100%;">Following Component updation has been done.</p>
                                <table>
                                    <tr>
                                        <td>
                                            <label for="componentNameForStatusUpdateTextFeild">Component Name:</label>
                                        </td>
                                        <td>
                                            <input type="text" id="componentNameForStatusUpdateTextFeild" readonly="readonly" style="border: none;" value="ComponentNameForStatusUpdateVariable"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="componentStatusTextFeild">Component Status:</label>
                                        </td>
                                        <td>
                                            <input type="text" id="componentStatusTextFeild" readonly="readonly" style="border: none;" value="ComponentStatusUpdateVariable"/>
                                        </td>
                                    </tr>
                                </table>
                                
                            </div>
                            <!--end of componentStatusChangeDiv-->
                            <div id="divForDataCenterUpdate">
                                <p style="float:left; width:100%;">Following Data Center updation has been done.</p>
                                <table>
                                    <tr>
                                        <td>
                                            <label for="componentNameForDataCenterUpdateTextFeild">Component Name:</label>
                                        </td>
                                        <td>
                                            <input type="text" id="componentNameForDataCenterUpdateTextFeild" readonly="readonly" style="border: none;" value="ComponentNameForDataCenterUpdateVariable"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="componentDataCenterTextFeild">Updated Data Center:</label>
                                        </td>
                                        <td>
                                            <input type="text" id="componentDataCenterTextFeild" readonly="readonly" style="border: none;" value="DataCenterVariable"/>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <!--end of dataCenterChangeUpdate-->
                        </div>
                        <!--end of componentUpdateDiv-->
                        <br><br><br>

                        <a href="linkToBeChanged">Go To Page</a>
                    </div>
                </center>
            </div>
        </center>
    </body>
</html>')
INSERT [dbo].[DBLogHistory] ([DBLogId], [DBCompanyId], [DBCSId], [DBIncidentId], [DBComponentName], [DBIncidentName], [DBIncidentDetails], [DBDateTimeStart], [DBStatus], [DBDateTimeEnd]) VALUES (622, 45, 39, -1, N'Database', N'', N'', CAST(0x07EAB2320268653B0B AS DateTime2), N'Operational', NULL)
INSERT [dbo].[DBLogHistory] ([DBLogId], [DBCompanyId], [DBCSId], [DBIncidentId], [DBComponentName], [DBIncidentName], [DBIncidentDetails], [DBDateTimeStart], [DBStatus], [DBDateTimeEnd]) VALUES (623, 45, 40, -1, N'Emails', N'', N'', CAST(0x07A499350268653B0B AS DateTime2), N'Operational', NULL)
INSERT [dbo].[DBLogHistory] ([DBLogId], [DBCompanyId], [DBCSId], [DBIncidentId], [DBComponentName], [DBIncidentName], [DBIncidentDetails], [DBDateTimeStart], [DBStatus], [DBDateTimeEnd]) VALUES (624, 45, 41, -1, N'Service-Bus', N'', N'', CAST(0x075AD2360268653B0B AS DateTime2), N'Operational', NULL)
INSERT [dbo].[DBLogHistory] ([DBLogId], [DBCompanyId], [DBCSId], [DBIncidentId], [DBComponentName], [DBIncidentName], [DBIncidentDetails], [DBDateTimeStart], [DBStatus], [DBDateTimeEnd]) VALUES (625, 45, 42, -1, N'SVService', N'', N'', CAST(0x07FAE3370268653B0B AS DateTime2), N'Operational', NULL)
INSERT [dbo].[DBLogHistory] ([DBLogId], [DBCompanyId], [DBCSId], [DBIncidentId], [DBComponentName], [DBIncidentName], [DBIncidentDetails], [DBDateTimeStart], [DBStatus], [DBDateTimeEnd]) VALUES (626, 45, 43, -1, N'User-Profiles', N'', N'', CAST(0x0783F5380268653B0B AS DateTime2), N'Operational', NULL)
INSERT [dbo].[DBLogHistory] ([DBLogId], [DBCompanyId], [DBCSId], [DBIncidentId], [DBComponentName], [DBIncidentName], [DBIncidentDetails], [DBDateTimeStart], [DBStatus], [DBDateTimeEnd]) VALUES (628, 45, 39, 179, N'Database', N'testIncident1', N'testIncident1', CAST(0x07C3DE101868653B0B AS DateTime2), N'Performance Degradation', CAST(0x0748669C7780653B0B AS DateTime2))
INSERT [dbo].[DBLogHistory] ([DBLogId], [DBCompanyId], [DBCSId], [DBIncidentId], [DBComponentName], [DBIncidentName], [DBIncidentDetails], [DBDateTimeStart], [DBStatus], [DBDateTimeEnd]) VALUES (630, 45, 43, 180, N'User-Profiles', N'testIncident2', N'testIncident2', CAST(0x070A2C332868653B0B AS DateTime2), N'Service Disruption', CAST(0x07E8241B7C80653B0B AS DateTime2))
INSERT [dbo].[DBLogHistory] ([DBLogId], [DBCompanyId], [DBCSId], [DBIncidentId], [DBComponentName], [DBIncidentName], [DBIncidentDetails], [DBDateTimeStart], [DBStatus], [DBDateTimeEnd]) VALUES (632, 45, 41, 181, N'Service-Bus', N'testIncident3', N'testIncident3', CAST(0x07EF9C043368653B0B AS DateTime2), N'Performance Degradation', CAST(0x073443247A80653B0B AS DateTime2))
INSERT [dbo].[DBLogHistory] ([DBLogId], [DBCompanyId], [DBCSId], [DBIncidentId], [DBComponentName], [DBIncidentName], [DBIncidentDetails], [DBDateTimeStart], [DBStatus], [DBDateTimeEnd]) VALUES (633, 46, 44, -1, N'Database', N'', N'', CAST(0x073CE64EE36E653B0B AS DateTime2), N'Operational', NULL)
INSERT [dbo].[DBLogHistory] ([DBLogId], [DBCompanyId], [DBCSId], [DBIncidentId], [DBComponentName], [DBIncidentName], [DBIncidentDetails], [DBDateTimeStart], [DBStatus], [DBDateTimeEnd]) VALUES (634, 46, 45, -1, N'Emails', N'', N'', CAST(0x07D7A551E36E653B0B AS DateTime2), N'Operational', NULL)
INSERT [dbo].[DBLogHistory] ([DBLogId], [DBCompanyId], [DBCSId], [DBIncidentId], [DBComponentName], [DBIncidentName], [DBIncidentDetails], [DBDateTimeStart], [DBStatus], [DBDateTimeEnd]) VALUES (635, 46, 46, -1, N'Service-Bus', N'', N'', CAST(0x078EDE52E36E653B0B AS DateTime2), N'Operational', NULL)
INSERT [dbo].[DBLogHistory] ([DBLogId], [DBCompanyId], [DBCSId], [DBIncidentId], [DBComponentName], [DBIncidentName], [DBIncidentDetails], [DBDateTimeStart], [DBStatus], [DBDateTimeEnd]) VALUES (636, 46, 47, -1, N'SVService', N'', N'', CAST(0x0757C953E36E653B0B AS DateTime2), N'Operational', NULL)
INSERT [dbo].[DBLogHistory] ([DBLogId], [DBCompanyId], [DBCSId], [DBIncidentId], [DBComponentName], [DBIncidentName], [DBIncidentDetails], [DBDateTimeStart], [DBStatus], [DBDateTimeEnd]) VALUES (637, 46, 48, -1, N'User-Profiles', N'', N'', CAST(0x07A0B354E36E653B0B AS DateTime2), N'Operational', NULL)
INSERT [dbo].[DBLogHistory] ([DBLogId], [DBCompanyId], [DBCSId], [DBIncidentId], [DBComponentName], [DBIncidentName], [DBIncidentDetails], [DBDateTimeStart], [DBStatus], [DBDateTimeEnd]) VALUES (639, 45, 42, 182, N'SVService', N'testIncident4', N'testIncident4', CAST(0x07EBD2124F87663B0B AS DateTime2), N'Performance Degradation', CAST(0x076840DE1E616A3B0B AS DateTime2))
INSERT [dbo].[DBLogin] ([DBUsername], [DBPassword], [DBAccountType]) VALUES (N'CheckAdmin', N'$hello1234', N'Edit')
INSERT [dbo].[DBLogin] ([DBUsername], [DBPassword], [DBAccountType]) VALUES (N'MasterAdmin', N'$abcd1234', N'Edit')
INSERT [dbo].[DBLogin] ([DBUsername], [DBPassword], [DBAccountType]) VALUES (N'TestMe', N'new', N'Edit')
INSERT [dbo].[DBMaster_DBComponent_With_Status] ([DBMasterComponentName]) VALUES (N'Database')
INSERT [dbo].[DBMaster_DBComponent_With_Status] ([DBMasterComponentName]) VALUES (N'Emails')
INSERT [dbo].[DBMaster_DBComponent_With_Status] ([DBMasterComponentName]) VALUES (N'Service-Bus')
INSERT [dbo].[DBMaster_DBComponent_With_Status] ([DBMasterComponentName]) VALUES (N'SVService')
INSERT [dbo].[DBMaster_DBComponent_With_Status] ([DBMasterComponentName]) VALUES (N'User-Profiles')
SET ANSI_PADDING ON

GO
/****** Object:  Index [CUN]    Script Date: 23-05-2016 14:41:19 ******/
ALTER TABLE [dbo].[DBCompany] ADD  CONSTRAINT [CUN] UNIQUE NONCLUSTERED 
(
	[DBURL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [CUNN]    Script Date: 23-05-2016 14:41:19 ******/
ALTER TABLE [dbo].[DBCompany] ADD  CONSTRAINT [CUNN] UNIQUE NONCLUSTERED 
(
	[DBCompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
