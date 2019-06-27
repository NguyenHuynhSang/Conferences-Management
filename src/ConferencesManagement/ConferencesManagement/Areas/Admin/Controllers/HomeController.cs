using ConferencesManagement.Common;
using Models;
using Models.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferencesManagement.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {

            CommonConstants.CURRENT_HOITHAO = (new HoiNghiDao().GetActiveHoiThao()).ID;
           
            return View();
        }

        [ChildActionOnly]
        public ActionResult SpeakerMenu()
        {
            var model = new SpeakerDao().GetSpeakersJoinConference(CommonConstants.CURRENT_HOITHAO);
            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult ScheduleMainMenu(string searchingString, int page = 1, int pageSize = 10)
        {
            var dao = new ScheduleDetailDao();
            var result = dao.GetScheduleDetailForIndex(searchingString);
            ViewBag.Searching = searchingString;
            return View(result);
        }
    
        public void SetViewBack(long? selectedid = null)
        {

            var dao = new ScheduleDao();
            ViewBag.Schedules = (dao.GetScheduleByCurrentHoiThao(CommonConstants.CURRENT_HOITHAO)).ToList();
        }
        [ChildActionOnly]
        public ActionResult TopicMenu(string searchingString, int page = 1, int pageSize = 5)
        {
            var currentHoiThao = (new HoiNghiDao().GetActiveHoiThao()).ID;
            var model = new TopicDao().GetTopicForIndexMenu(page,pageSize,searchingString,CommonConstants.CURRENT_HOITHAO);
            return PartialView(model);

        }

        [ChildActionOnly]
        public ActionResult HoiThaoDetail()
        {
            var db = new HoiNghiDao();
            var model = db.GetActiveHoiThao();
           SetHoiThaoDetail();
            return PartialView(model);
        }

        public void SetHoiThaoDetail()
        {
            var DSSpeaker = (new HoiThaoDetailDao()).GetListSpeakerJoinHoiThao((int)CommonConstants.CURRENT_HOITHAO);
            ViewBag.DSSpeaker = DSSpeaker;
         

        }
    }
}