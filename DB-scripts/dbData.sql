INSERT [dbo].[DBMaster_DBComponent_With_Status] ([DBMasterComponentName]) VALUES (N'Connect')
INSERT [dbo].[DBMaster_DBComponent_With_Status] ([DBMasterComponentName]) VALUES (N'Database')
INSERT [dbo].[DBMaster_DBComponent_With_Status] ([DBMasterComponentName]) VALUES (N'Emails')
INSERT [dbo].[DBMaster_DBComponent_With_Status] ([DBMasterComponentName]) VALUES (N'Service-Bus')
INSERT [dbo].[DBMaster_DBComponent_With_Status] ([DBMasterComponentName]) VALUES (N'SVService')
INSERT [dbo].[DBMaster_DBComponent_With_Status] ([DBMasterComponentName]) VALUES (N'User-Profiles')
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
INSERT [dbo].[DBLogin] ([DBUsername], [DBPassword], [DBAccountType]) VALUES (N'centraluser', N'$abcd1234', N'edit')
INSERT [dbo].[DBLogin] ([DBUsername], [DBPassword], [DBAccountType]) VALUES (N'serviceAccountDev', N'$abcd1234', N'edit')
