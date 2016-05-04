using roughProj.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace roughProj.Controllers
{
    public class testController : Controller
    {
        //
        // GET: /tset/

        public ActionResult testView()
        {
            return View();
        }

        public ActionResult MainView()
        {
            return View();
        }

        public int startEvent(string pstrEventId)
        {
            testClass testObj = new testClass();
            return(testObj.startingEvent(pstrEventId));
        }

        public void stopEvent(string pstrEventId)
        {
            testClass testObj = new testClass();
            testObj.stoppingEvent(int.Parse(pstrEventId));
        }
        public void addNewEvent(string pstrEventId, string pstrEventName, string pstrEventDetails) 
        {
            testClass testObj = new testClass();
            testObj.addingNewEvent(pstrEventId, pstrEventName, pstrEventDetails);
        }

        public JsonResult getEvents() 
        {
            testClass testObj = new testClass();
            return Json(testObj.gettingEvents(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult getEventTimeStored(string pstrEventId, string pstrEventStart, string pstrNow) 
        {
            testClass testObj = new testClass();
            DateTime eventStart = new DateTime(), nowTime = new DateTime();
            DateTimeOffset dto;
            if (DateTimeOffset.TryParseExact(pstrEventStart, "ddd MMM dd yyyy HH:mm:ss 'GMT'K '(India Standard Time)'", CultureInfo.InvariantCulture, DateTimeStyles.None, out dto)) 
            {
                eventStart = dto.DateTime;
            }
            
            if (DateTimeOffset.TryParseExact(pstrNow, "ddd MMM dd yyyy HH:mm:ss 'GMT'K '(India Standard Time)'", CultureInfo.InvariantCulture, DateTimeStyles.None, out dto))
            {
                nowTime = dto.DateTime;
            }
            List<NewModel> testList = testObj.gettingEventTimeStored(pstrEventId, eventStart, nowTime);
            return Json(testList, JsonRequestBehavior.AllowGet);
        }

        public JsonResult getDetailsOfEvent(string pstrId) 
        {
            testClass testObj = new testClass();
            int id = int.Parse(pstrId);
            return Json(testObj.gettingDetailsOfEvent(id), JsonRequestBehavior.AllowGet);
        }
    }
}
