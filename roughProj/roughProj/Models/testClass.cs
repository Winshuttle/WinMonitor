using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace roughProj.Models
{
    public class testClass
    {
        public int getseq()
        {
            testModelContext contextObj = new testModelContext();
            return( contextObj.Database.SqlQuery<int>("select next value for testSequence").FirstOrDefault());
        }
        
        public int startingEvent(string pstrEventId)
        {
            testModelContext contextObj = new testModelContext();
            int id = getseq();
            TimeStoringTable tableObj = new TimeStoringTable();
            tableObj.Id = id;
            tableObj.EventId = int.Parse(pstrEventId);
            tableObj.EventStartTime = System.DateTime.Now;
            tableObj.EventStopTime = null;
            contextObj.TimeStoringTables.Add(tableObj);
            contextObj.SaveChanges();
            return id;
            
        }
        public void stoppingEvent(int pstrEventId)
        {
            testModelContext contextObj = new testModelContext();
            TimeStoringTable tableObj = new TimeStoringTable();
            tableObj = (from eventObj in contextObj.TimeStoringTables
                        where eventObj.Id == pstrEventId
                        select eventObj).FirstOrDefault();
            tableObj.EventStopTime = System.DateTime.Now;
            contextObj.SaveChanges();
        }

        public void addingNewEvent(string pstrEventId, string pstrEventName, string pstrEventDetails)
        {
            testModelContext contextObj = new testModelContext();
            EventDataTable eventObj = new EventDataTable();
            eventObj.EventId = int.Parse(pstrEventId);
            eventObj.EventName = pstrEventName;
            eventObj.EventDetails = pstrEventDetails;
            contextObj.EventDataTables.Add(eventObj);
            contextObj.SaveChanges();
        }

        public List<EventDataTable> gettingEvents() 
        {
            testModelContext contextObj = new testModelContext();
            return (contextObj.Database.SqlQuery<EventDataTable>("select * from EventDataTable").ToList());
        }

        public List<NewModel> gettingEventTimeStored( string pstrEventId, DateTime eventStart, DateTime eventNow )
        {
            testModelContext contextObj = new testModelContext();
            int a = 0;
            List<NewModel> list = new List<NewModel>();
            NewModel mod = new NewModel();
            List<TimeStoringTable> timeList = new List<TimeStoringTable>();
            timeList = contextObj.Database.SqlQuery<TimeStoringTable>("select * from TimeStoringTable where EventId=" + pstrEventId + " and EventStartTime between '" + eventStart + "' and '" + eventNow + "' and EventStopTime between '" + eventStart + "' and '" + eventNow + "';").ToList();
            
            if (timeList.Count > 0)
            {
                mod = new NewModel();
                a = contextObj.Database.SqlQuery<int>("select DATEDIFF(s,'" + eventStart + "','" + timeList[0].EventStartTime + "');").FirstOrDefault();
                mod.EventId = 0;
                mod.diff = a;
                list.Add(mod);
                int i;
                DateTime? lastInList = DateTime.Now;
                for (i = 0; i < timeList.Count; i++)
                {
                    mod = new NewModel();
                    a = contextObj.Database.SqlQuery<int>("select DATEDIFF(s,'" + timeList[i].EventStartTime + "','" + timeList[i].EventStopTime + "');").FirstOrDefault();
                    mod.EventId = timeList[i].EventId;
                    mod.diff = a;
                    list.Add(mod);

                    if (i != timeList.Count - 1)
                    {
                        mod = new NewModel();
                        a = contextObj.Database.SqlQuery<int>("select DATEDIFF(s,'" + timeList[i].EventStopTime + "','" + timeList[i + 1].EventStartTime + "');").FirstOrDefault();
                        mod.EventId = 0;
                        mod.diff = a;
                        list.Add(mod);
                    }
                    else
                        lastInList = timeList[i].EventStopTime;
                }
                mod = new NewModel();
                a = contextObj.Database.SqlQuery<int>("select DATEDIFF(s,'" + lastInList + "','" + eventNow + "');").FirstOrDefault();
                mod.EventId = 0;
                mod.diff = a;
                list.Add(mod);
            }
            
            return list;
        }

        public EventDataTable gettingDetailsOfEvent(int pstrId)
        {
            testModelContext contextObj = new testModelContext();
            EventDataTable tabObj = contextObj.Database.SqlQuery<EventDataTable>("select * from EventDataTable where EventId='" + pstrId + "';").FirstOrDefault();
            return tabObj;
        }

    }
}